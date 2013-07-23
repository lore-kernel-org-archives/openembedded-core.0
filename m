Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 76B6B60FEE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 05:27:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6N5RARC014863
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 22 Jul 2013 22:27:11 -0700 (PDT)
Received: from [128.224.162.250] (128.224.162.250) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 22 Jul 2013 22:27:09 -0700
Message-ID: <51EE142C.9090701@windriver.com>
Date: Tue, 23 Jul 2013 13:27:08 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1374480160.git.jackie.huang@windriver.com>
	<f3bb321c76f2ed9b0b09cb283e4fdd7b0b37847a.1374480160.git.jackie.huang@windriver.com>
	<51ED7362.4080507@linux.intel.com>
In-Reply-To: <51ED7362.4080507@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] dbus: remove build host test in configure script
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
X-List-Received-Date: Tue, 23 Jul 2013 05:27:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 7/23/2013 2:01 AM, Saul Wold wrote:
> On 07/22/2013 01:14 AM, jackie.huang@windriver.com wrote:
>> From: Jackie Huang <jackie.huang@windriver.com>
>>
>> The dbus build tests the build host to detect what initscript
>> environment it expects.  Remove the test and set it to "redhat"
>> unconditionally as the oe-core initscript has a redhat-style pid file
>> path.
>>
>> Signed-off-by: Andy Ross <andy.ross@windriver.com
>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> ---
>>   meta/recipes-core/dbus/dbus-1.6.8/os-test.patch |   35
>> +++++++++++++++++++++++
>
> This file should be in dbus-1.6.10, please rebase against master.

rebased:

The following changes since commit 8fc6904fe97438478119db6cd23b7b4eb33b50aa:

   curl: add upstream status to patch (2013-07-18 12:21:13 -0700)

are available in the git repository at:
   git://git.pokylinux.org/poky-contrib jhuang0/r_bbappend_dbus_0723_0
 
http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/r_bbappend_dbus_0723_0

Jackie Huang (2):
   dbus: remove build host test in configure script
   dbus: add -o option into start-stop-daemon arguments

  meta/recipes-core/dbus/dbus-1.6.10/dbus-1.init   |    4 +-
  meta/recipes-core/dbus/dbus-1.6.10/os-test.patch |   35 
++++++++++++++++++++++
  meta/recipes-core/dbus/dbus.inc                  |    4 ++-
  3 files changed, 40 insertions(+), 3 deletions(-)
  create mode 100644 meta/recipes-core/dbus/dbus-1.6.10/os-test.patch


Thanks,
Jackie

>
> Thanks
>      Sau!
>
>>   meta/recipes-core/dbus/dbus.inc                 |    4 ++-
>>   2 files changed, 38 insertions(+), 1 deletions(-)
>>   create mode 100644 meta/recipes-core/dbus/dbus-1.6.8/os-test.patch
>>
>> diff --git a/meta/recipes-core/dbus/dbus-1.6.8/os-test.patch
>> b/meta/recipes-core/dbus/dbus-1.6.8/os-test.patch
>> new file mode 100644
>> index 0000000..79554b1
>> --- /dev/null
>> +++ b/meta/recipes-core/dbus/dbus-1.6.8/os-test.patch
>> @@ -0,0 +1,35 @@
>> +dbus: remove build host test in configure script
>> +
>> +The dbus build tests the build host to detect what initscript
>> +environment it expects.  Remove the test and set it to "redhat"
>> +unconditionally as the oe-core initscript has a redhat-style pid file
>> +path.
>> +
>> +Signed-off-by: Andy Ross <andy.ross@windriver.com>
>> +Upstream-Status: innappropriate [embedded]
>> +
>> +diff -u a/configure.ac b/configure.ac
>> +--- a/configure.ac    2012-08-28 11:23:43.040609874 -0700
>> ++++ b/configure.ac    2012-08-28 11:54:25.602913945 -0700
>> +@@ -1348,19 +1348,8 @@
>> + AS_AC_EXPAND(EXPANDED_LIBEXECDIR, "$libexecdir")
>> + AS_AC_EXPAND(EXPANDED_DATADIR, "$datadir")
>> +
>> +-#### Check our operating system
>> +-operating_system=unknown
>> +-if test -f /etc/redhat-release || test -f
>> $EXPANDED_SYSCONFDIR/redhat-release ; then
>> +-   operating_system=redhat
>> +-fi
>> +-
>> +-if test -f /etc/slackware-version || test -f
>> $EXPANDED_SYSCONFDIR/slackware-version ; then
>> +-   operating_system=slackware
>> +-fi
>> +-
>> +-if test -f /usr/bin/cygwin1.dll || test -f
>> $EXPANDED_BINDIR/cygwin1.dll ; then
>> +-   operating_system=cygwin
>> +-fi
>> ++#### Build host test removed from upstream code, openembedded
>> initscript is redhat-like:
>> ++operating_system=redhat
>> +
>> + #### Sort out init scripts
>> +
>> diff --git a/meta/recipes-core/dbus/dbus.inc
>> b/meta/recipes-core/dbus/dbus.inc
>> index b07aefa..580a936 100644
>> --- a/meta/recipes-core/dbus/dbus.inc
>> +++ b/meta/recipes-core/dbus/dbus.inc
>> @@ -16,7 +16,9 @@ INC_PR = "r6"
>>
>>   SRC_URI =
>> "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
>>              file://tmpdir.patch; \
>> -           file://dbus-1.init"
>> +           file://dbus-1.init \
>> +           file://os-test.patch \
>> +"
>>
>>   inherit useradd autotools pkgconfig gettext update-rc.d
>>
>>
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

