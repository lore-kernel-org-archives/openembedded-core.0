Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6003073999
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 04:18:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Mar 2015 21:17:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,386,1422950400"; d="scan'208";a="664092968"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 11 Mar 2015 21:18:55 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id CB7C4300001; Wed, 11 Mar 2015 21:18:38 -0700 (PDT)
Received: from 10.252.136.167 (SquirrelMail authenticated user randy.e.witt)
	by linux.intel.com with HTTP; Wed, 11 Mar 2015 21:18:38 -0700 (PDT)
Message-ID: <60821.10.252.136.167.1426133918.squirrel@linux.intel.com>
In-Reply-To: <13FDACD4-FC30-49CD-AC52-9D614F407C5D@gmail.com>
References: <1426109339-12975-1-git-send-email-randy.e.witt@linux.intel.com>
	<13FDACD4-FC30-49CD-AC52-9D614F407C5D@gmail.com>
Date: Wed, 11 Mar 2015 21:18:38 -0700 (PDT)
From: randy.e.witt@linux.intel.com
To: "Khem Raj" <raj.khem@gmail.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: Instruct the journal to always be volatile
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
X-List-Received-Date: Thu, 12 Mar 2015 04:18:57 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

>
>> On Mar 11, 2015, at 2:28 PM, Randy Witt <randy.e.witt@linux.intel.com>
>> wrote:
>>
>> When the storage mode for the journal is "auto" if /var/log/journal
>> exists then the journal will flush to /var/log/journal assuming that
>> /var/log/journal is persistent.
>>
>> However /var/log -> /var/volatile/log in poky, so even though
>> /var/log/journal exists, it is still volatile.
>>
>> Since this can cause ordering issues due to /var/volatile needing to be
>> mounted before the journal actually writes to it, just specify that the
>> journal
>> should always be volatile and never try to write to "persistent"
>> storage. The journal will exist in /run/log/journal only.
>>
>> This also disables the "After" of the journal on var-volatile.mount
>> since the ordering is no longer necessary when the journal is only
>> stored in /run/log/journal.
>>
>> [Yocto #7388]
>
>
> This is not right. What if I want persistent logs.? the options is just
> gone. Both cases should work. /var/volatile should only be used
> when doing ro-rfs its not FHS specified anyway. Lets not go with this
> patch.
The distro could still change it with a bbappend or additional
configuration files just like other settings. We don't have an option for
a persistent journal so I'm curious, how would both cases work currently?

Currently if a persistent journal is desired, the /var/log symlink has to
be changed to point to persistent storage, or /var/volatile has to be
dropped from /etc/fstab. These are also configuration changes.

The lesser of the two evils seems to be making it so that the journal
works in the volatile case, which is all we've ever supported in poky. If
a user wanted a non-volatile journal it was left to them to do.

I agree that the journal should be persistent, but I also agree with
Richard that seems to be too big of a change in behavior when we're so
close to the release point.

>>
>> Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
>> ---
>> meta/recipes-core/systemd/systemd/journald-volatile.conf | 6 ------
>> meta/recipes-core/systemd/systemd_219.bb                 | 4 ++--
>> 2 files changed, 2 insertions(+), 8 deletions(-)
>> delete mode 100644
>> meta/recipes-core/systemd/systemd/journald-volatile.conf
>>
>> diff --git a/meta/recipes-core/systemd/systemd/journald-volatile.conf
>> b/meta/recipes-core/systemd/systemd/journald-volatile.conf
>> deleted file mode 100644
>> index b11e160..0000000
>> --- a/meta/recipes-core/systemd/systemd/journald-volatile.conf
>> +++ /dev/null
>> @@ -1,6 +0,0 @@
>> -# If /var/volatile is a mount point then make sure to mount it before
>> -# the journal starts. This is because base-files creates a symlink
>> -# /var/log -> /var/volatile/log. And if the journal starts before the
>> mount
>> -# happens, the journal will appear empty until restarted.
>> -[Unit]
>> -After=var-volatile.mount
>> diff --git a/meta/recipes-core/systemd/systemd_219.bb
>> b/meta/recipes-core/systemd/systemd_219.bb
>> index d5eed08..f3bb0c4 100644
>> --- a/meta/recipes-core/systemd/systemd_219.bb
>> +++ b/meta/recipes-core/systemd/systemd_219.bb
>> @@ -48,7 +48,6 @@ SRC_URI =
>> "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
>>            file://00-create-volatile.conf \
>>            file://init \
>>            file://run-ptest \
>> -           file://journald-volatile.conf \
>>           "
>>
>> S = "${WORKDIR}/git"
>> @@ -145,7 +144,6 @@ do_install() {
>> 	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
>>
>> 	install -m 0644 ${WORKDIR}/00-create-volatile.conf
>> ${D}${sysconfdir}/tmpfiles.d/
>> -	install -D -m 0644 ${WORKDIR}/journald-volatile.conf
>> ${D}${systemd_unitdir}/system/systemd-journald.service.d/journald-volatile.conf
>>
>> 	if
>> ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)};
>> then
>> 		install -d ${D}${sysconfdir}/init.d
>> @@ -170,6 +168,8 @@ do_install() {
>>
>> 	# Enable journal to forward message to syslog daemon
>> 	sed -i -e 's/.*ForwardToSyslog.*/ForwardToSyslog=yes/'
>> ${D}${sysconfdir}/systemd/journald.conf
>> +	# Make the journal volatile by default.
>> +	sed -i -e 's/.*Storage.*/Storage=volatile/'
>> ${D}${sysconfdir}/systemd/journald.conf
>> 	# its needed in 216 upstream has fixed it with
>> 919699ec301ea507edce4a619141ed22e789ac0d
>> 	# don't order journal flushing afte remote-fs.target
>> 	sed -i -e 's/ remote-fs.target$//'
>> ${D}${systemd_unitdir}/system/systemd-journal-flush.service
>> --
>> 1.9.3
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


