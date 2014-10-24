Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BD41C6AC19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 07:36:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9O7aMdr008485
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 Oct 2014 00:36:22 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Fri, 24 Oct 2014 00:36:21 -0700
Message-ID: <544A01CD.8070704@windriver.com>
Date: Fri, 24 Oct 2014 15:37:49 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <cover.1414121198.git.Qi.Chen@windriver.com>
	<22cefd15362d8fdc8e8e06324412f606f5feca86.1414121198.git.Qi.Chen@windriver.com>
	<E0AE8D91-A863-456F-9F59-BEBE56BCF062@dominion.thruhere.net>
In-Reply-To: <E0AE8D91-A863-456F-9F59-BEBE56BCF062@dominion.thruhere.net>
X-Originating-IP: [128.224.162.187]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: fix systemd-udev-hwdb-update service
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
X-List-Received-Date: Fri, 24 Oct 2014 07:36:32 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/24/2014 02:09 PM, Koen Kooi wrote:
>> Op 24 okt. 2014, om 07:58 heeft Chen Qi <Qi.Chen@windriver.com> het volgende geschreven:
>>
>> The new version of systemd has implemented the following feature.
>> Opointer.de/blog/projects/stateless.html
>>
>> As a result, the systemd-udev-hwdb-update.service would always run
>> at first boot. This will cause failure if the target device doesn't
>> have enough storage space. Besides, as we run `udevadm hwdb --update' as
>> a postinst of udev-hwdb at rootfs time, there's no need to run this
>> again at system start-up.
>>
>> The purpose of this patch is as follows.
>> If `udev hwdb --update' fails at rootfs time, systemd-udev-hwdb-update.service
>> is executed at first boot; otherwise, the service is not executed.
>>
>> This patch achieves the above goal by setting CondistonNeedsUpdate to
>> "/etc/udev" in the service file, and creating /etc/udev/.updated file if the
>> postinst succeeds.
> Ehm, /etc/udev can be created by other packages, why not test for the file you create?
>
> regards,
>
> Koen
>

Hi Koen,

The tested path must be a directory. If we test a file, then condition 
will always be true.

Below are the related codes from systemd:

<code_snippet>

static bool condition_test_needs_update(Condition *c) {
         const char *p;
         struct stat usr, other;

         assert(c);
         assert(c->parameter);
         assert(c->type == CONDITION_NEEDS_UPDATE);

         /* If the file system is read-only we shouldn't suggest an 
update */
         if (path_is_read_only_fs(c->parameter) > 0)
                 return c->negate;

         /* Any other failure means we should allow the condition to be 
true,
          * so that we rather invoke too many update tools then too
          * few. */

         if (!path_is_absolute(c->parameter))
                 return !c->negate;

         p = strappenda(c->parameter, "/.updated");
         if (lstat(p, &other) < 0)
                 return !c->negate;

         if (lstat("/usr/", &usr) < 0)
                 return !c->negate;

         return (usr.st_mtim.tv_sec > other.st_mtim.tv_sec ||
                 (usr.st_mtim.tv_sec == other.st_mtim.tv_sec && 
usr.st_mtim.tv_nsec > other.st_mtim.tv_nsec)) == !c->negate;
}

</code_snippet>

This patch makes use of the '.updated' trick.

Best Regards,
Chen Qi

>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>> meta/recipes-core/systemd/systemd_216.bb | 18 +++++++++++++++---
>> 1 file changed, 15 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
>> index ebf9395..cd81818 100644
>> --- a/meta/recipes-core/systemd/systemd_216.bb
>> +++ b/meta/recipes-core/systemd/systemd_216.bb
>> @@ -149,6 +149,10 @@ do_install() {
>>
>> 	# Enable journal to forward message to syslog daemon
>> 	sed -i -e 's/.*ForwardToSyslog.*/ForwardToSyslog=yes/' ${D}${sysconfdir}/systemd/journald.conf
>> +
>> +	# Make systemd-udev-hwdb-update to check /etc/udev
>> +	cp ${D}${systemd_unitdir}/system/systemd-udev-hwdb-update.service ${D}${sysconfdir}/systemd/system
>> +	sed -i -e 's#ConditionNeedsUpdate=/etc#ConditionNeedsUpdate=/etc/udev#g' ${D}${sysconfdir}/systemd/system/systemd-udev-hwdb-update.service
>> }
>>
>> do_install_ptest () {
>> @@ -355,10 +359,18 @@ ALTERNATIVE_PRIORITY[runlevel] ?= "300"
>>
>> pkg_postinst_udev-hwdb () {
>> 	if test -n "$D"; then
>> -		${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb --update \
>> -			--root $D
>> +		if ${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb --update \
>> +			--root $D; then
>> +			touch $D/etc/udev/.updated
>> +		else
>> +			exit 1
>> +		fi
>> 	else
>> -		udevadm hwdb --update
>> +		if udevadm hwdb --update; then
>> +			touch $D/etc/udev/.updated
>> +		else
>> +			exit 1
>> +		fi
>> 	fi
>> }
>>
>> -- 
>> 1.9.1
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>


