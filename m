Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6E2E860034
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 15:46:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 24 Mar 2015 08:46:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,458,1422950400"; d="scan'208";a="669874490"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 24 Mar 2015 08:46:26 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id D2D5E6A4090; Tue, 24 Mar 2015 08:46:07 -0700 (PDT)
Received: from 10.254.107.142 (SquirrelMail authenticated user randy.e.witt)
	by linux.intel.com with HTTP; Tue, 24 Mar 2015 08:46:07 -0700 (PDT)
Message-ID: <59624.10.254.107.142.1427211967.squirrel@linux.intel.com>
In-Reply-To: <CAMKF1srT2URjkAjC4uEA6GFiAQqywgfBewS8t=Aoemym-rKuew@mail.gmail.com>
References: <1427156894-24614-1-git-send-email-randy.e.witt@linux.intel.com>
	<1427156894-24614-3-git-send-email-randy.e.witt@linux.intel.com>
	<CAMKF1srT2URjkAjC4uEA6GFiAQqywgfBewS8t=Aoemym-rKuew@mail.gmail.com>
Date: Tue, 24 Mar 2015 08:46:07 -0700 (PDT)
From: randy.e.witt@linux.intel.com
To: "Khem Raj" <raj.khem@gmail.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] image.bbclass: Empty /var/volatile if it is a mount point
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
X-List-Received-Date: Tue, 24 Mar 2015 15:46:26 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> On Mon, Mar 23, 2015 at 5:28 PM, Randy Witt
> <randy.e.witt@linux.intel.com> wrote:
>> If /var/volatile is a mount point it shouldn't contain any files before
>> mount time. If files are there, they will no longer be able to be
>> accessed
>> once the tmpfs gets mounted at /var/volatile.
>
> why not use copy-bind when mounting it second time as tmpfs ?
>

Khem, could you elaborate? I'm not sure I know the mechanism to which you
are referring.

>>
>> This problem can be seen for instance when systemd creates
>> /var/volatile/log/journal as part of its package installation. It then
>> assumes the journal is persistent even though /var/volatile/log/journal
>> goes away shortly thereafter.
>>
>> This change makes sure that there are no files in /var/volatile if it is
>> to be used as a mount point.
>>
>> [Yocto #7388]
>>
>> Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
>> ---
>>  meta/classes/image.bbclass | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>> index 89eb5f3..dfedf9d 100644
>> --- a/meta/classes/image.bbclass
>> +++ b/meta/classes/image.bbclass
>> @@ -181,6 +181,8 @@ POSTINST_LOGFILE ?=
>> "${localstatedir}/log/postinstall.log"
>>  SYSTEMD_DEFAULT_TARGET ?= '${@bb.utils.contains("IMAGE_FEATURES",
>> "x11-base", "graphical.target", "multi-user.target", d)}'
>>  ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES",
>> "systemd", "set_systemd_default_target; ", "", d)}'
>>
>> +ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile;'
>> +
>>  # some default locales
>>  IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
>>
>> @@ -377,6 +379,20 @@ set_systemd_default_target () {
>>         fi
>>  }
>>
>> +# If /var/volatile is not empty, we have seen problems where programs
>> such as the
>> +# journal make assumptions based on the contents of /var/volatile. The
>> journal
>> +# would then write to /var/volatile before it was mounted, thus hiding
>> the
>> +# items previously written.
>> +#
>> +# This change is to attempt to fix those types of issues in a way that
>> doesn't
>> +# affect users that may not be using /var/volatile.
>> +empty_var_volatile () {
>> +       match=`awk '$1 !~ "#" && $2 ~ /\/var\/volatile/{print $2}'
>> ${IMAGE_ROOTFS}/etc/fstab 2> /dev/null`
>> +       if [ -n "$match" ]; then
>> +               find ${IMAGE_ROOTFS}/var/volatile -mindepth 1 -delete
>> +       fi
>> +}
>> +
>>  # Turn any symbolic /sbin/init link into a file
>>  remove_init_link () {
>>         if [ -h ${IMAGE_ROOTFS}/sbin/init ]; then
>> --
>> 1.9.3
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


