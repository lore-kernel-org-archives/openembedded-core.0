Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 987A87479D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 02:22:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6C2M66E013436
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 19:22:07 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Wed, 11 Jul 2018 19:22:05 -0700
To: <openembedded-core@lists.openembedded.org>, "Zhou, Li"
	<li.zhou@windriver.com>
References: <1524119747-12549-1-git-send-email-li.zhou@windriver.com>
	<5dcc4825-e136-c12d-3c5e-44995bd5dd32@windriver.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <2315a055-fc50-aeda-13c4-d66b5cc33475@windriver.com>
Date: Thu, 12 Jul 2018 10:22:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <5dcc4825-e136-c12d-3c5e-44995bd5dd32@windriver.com>
X-Originating-IP: [128.224.162.228]
Subject: Re: [PATCH] eudev: create static nodes from modules
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jul 2018 02:22:06 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Ping

On 06/04/2018 10:23 AM, Zhou, Li wrote:
> Ping
>
>
> On 04/19/2018 02:35 PM, Li Zhou wrote:
>> Revert commit <src/udev/udevd.c: remove create static nodes from 
>> modules>
>> because /dev/net/tun is usually needed to already been there when system
>> boots up. With this commit, /dev/net/tun is missing when sysvinit is
>> used.
>>
>> Signed-off-by: Li Zhou <li.zhou@windriver.com>
>> ---
>>   ...01-eudev-create-static-nodes-from-modules.patch | 106 
>> +++++++++++++++++++++
>>   meta/recipes-core/udev/eudev_3.2.5.bb              |   1 +
>>   2 files changed, 107 insertions(+)
>>   create mode 100644 
>> meta/recipes-core/udev/eudev/0001-eudev-create-static-nodes-from-modules.patch
>>
>> diff --git 
>> a/meta/recipes-core/udev/eudev/0001-eudev-create-static-nodes-from-modules.patch 
>> b/meta/recipes-core/udev/eudev/0001-eudev-create-static-nodes-from-modules.patch 
>>
>> new file mode 100644
>> index 0000000..583873e
>> --- /dev/null
>> +++ 
>> b/meta/recipes-core/udev/eudev/0001-eudev-create-static-nodes-from-modules.patch
>> @@ -0,0 +1,106 @@
>> +From 73df4fe0bd6fd2f2600f0d82b3f121c604baf1be Mon Sep 17 00:00:00 2001
>> +From: Li Zhou <li.zhou@windriver.com>
>> +Date: Thu, 12 Apr 2018 05:14:27 -0400
>> +Subject: [PATCH] eudev: create static nodes from modules
>> +
>> +Revert commit <src/udev/udevd.c: remove create static nodes from 
>> modules>
>> +
>> +Upstream-Status: Inappropriate [Just for user's convinence]
>> +
>> +Signed-off-by: Li Zhou <li.zhou@windriver.com>
>> +---
>> + src/udev/udevd.c | 71 
>> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>> + 1 file changed, 71 insertions(+)
>> +
>> +diff --git a/src/udev/udevd.c b/src/udev/udevd.c
>> +index 9c33eba..95774a1 100644
>> +--- a/src/udev/udevd.c
>> ++++ b/src/udev/udevd.c
>> +@@ -979,6 +979,76 @@ static void handle_signal(struct udev *udev, 
>> int signo) {
>> +         }
>> + }
>> +
>> ++static void static_dev_create_from_modules(struct udev *udev) {
>> ++        struct utsname kernel;
>> ++        char modules[UTIL_PATH_SIZE];
>> ++        char buf[4096];
>> ++        FILE *f;
>> ++
>> ++        if (uname(&kernel) < 0) {
>> ++                log_error("uname failed: %m");
>> ++                return;
>> ++        }
>> ++
>> ++        strscpyl(modules, sizeof(modules), ROOTPREFIX 
>> "/lib/modules/", kernel.release, "/modules.devname", NULL);
>> ++        f = fopen(modules, "re");
>> ++        if (f == NULL)
>> ++                return;
>> ++
>> ++        while (fgets(buf, sizeof(buf), f) != NULL) {
>> ++                char *s;
>> ++                const char *modname;
>> ++                const char *devname;
>> ++                const char *devno;
>> ++                int maj, min;
>> ++                char type;
>> ++                mode_t mode;
>> ++                char filename[UTIL_PATH_SIZE];
>> ++
>> ++                if (buf[0] == '#')
>> ++                        continue;
>> ++
>> ++                modname = buf;
>> ++                s = strchr(modname, ' ');
>> ++                if (s == NULL)
>> ++                        continue;
>> ++                s[0] = '\0';
>> ++
>> ++                devname = &s[1];
>> ++                s = strchr(devname, ' ');
>> ++                if (s == NULL)
>> ++                        continue;
>> ++                s[0] = '\0';
>> ++
>> ++                devno = &s[1];
>> ++                s = strchr(devno, ' ');
>> ++                if (s == NULL)
>> ++                        s = strchr(devno, '\n');
>> ++                if (s != NULL)
>> ++                        s[0] = '\0';
>> ++                if (sscanf(devno, "%c%u:%u", &type, &maj, &min) != 3)
>> ++                        continue;
>> ++
>> ++                mode  = 0600;
>> ++                if (type == 'c')
>> ++                        mode |= S_IFCHR;
>> ++                else if (type == 'b')
>> ++                        mode |= S_IFBLK;
>> ++                else
>> ++                        continue;
>> ++
>> ++                strscpyl(filename, sizeof(filename), "/dev/", 
>> devname, NULL);
>> ++                mkdir_parents_label(filename, 0755);
>> ++                mac_selinux_create_file_prepare(filename, mode);
>> ++                log_debug("mknod '%s' %c%u:%u", filename, type, 
>> maj, min);
>> ++                if (mknod(filename, mode, makedev(maj, min)) < 0 && 
>> errno == EEXIST)
>> ++                        utimensat(AT_FDCWD, filename, NULL, 0);
>> ++                mac_selinux_create_file_clear();
>> ++        }
>> ++
>> ++        fclose(f);
>> ++}
>> ++
>> + /*
>> +  * read the kernel command line, in case we need to get into debug 
>> mode
>> +  *   udev.log-priority=<level>                 syslog priority
>> +@@ -1183,6 +1253,7 @@ int main(int argc, char *argv[]) {
>> +         }
>> +
>> +         dev_setup(NULL, UID_INVALID, GID_INVALID);
>> ++        static_dev_create_from_modules(udev);
>> +
>> +         /* before opening new files, make sure std{in,out,err} fds 
>> are in a sane state */
>> +         if (arg_daemonize) {
>> +--
>> +2.7.4
>> +
>> diff --git a/meta/recipes-core/udev/eudev_3.2.5.bb 
>> b/meta/recipes-core/udev/eudev_3.2.5.bb
>> index 88ad8f1..9237944 100644
>> --- a/meta/recipes-core/udev/eudev_3.2.5.bb
>> +++ b/meta/recipes-core/udev/eudev_3.2.5.bb
>> @@ -18,6 +18,7 @@ SRC_URI = 
>> "http://dev.gentoo.org/~blueness/${BPN}/${BP}.tar.gz \
>>              file://permissions.rules \
>>              file://run.rules \
>>              file://udev.rules \
>> + file://0001-eudev-create-static-nodes-from-modules.patch \
>>   "
>>     SRC_URI[md5sum] = "6ca08c0e14380f87df8e8aceac123671"
>

-- 
BRs

Sandy(Li Changqing)
+861084778653


