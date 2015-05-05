Return-Path: <leandro.maciel.dorileo@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5234A6AC3E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 20:38:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 05 May 2015 13:38:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,374,1427785200"; d="scan'208";a="724212188"
Received: from unknown (HELO [10.218.100.121]) ([10.218.100.121])
	by orsmga002.jf.intel.com with ESMTP; 05 May 2015 13:38:35 -0700
Message-ID: <55492A4A.6010305@intel.com>
Date: Tue, 05 May 2015 17:38:34 -0300
From: Leandro Dorileo <leandro.maciel.dorileo@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1430775804-30845-1-git-send-email-bruno.bottazzini@intel.com>	<1430775804-30845-4-git-send-email-bruno.bottazzini@intel.com>
	<20150505200129.GA7291@ad.chargestorm.se>
In-Reply-To: <20150505200129.GA7291@ad.chargestorm.se>
Subject: Re: [PATCH V2 3/3] systemd: split modules into packages
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
X-List-Received-Date: Tue, 05 May 2015 20:38:35 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/05/2015 05:01 PM, Anders Darander wrote:
> * Bruno Bottazzini <bruno.bottazzini@intel.com> [150504 23:43]:
>
>> diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
>> index b4bff18..2da74dc 100644
>> --- a/meta/recipes-core/systemd/systemd_219.bb
>> +++ b/meta/recipes-core/systemd/systemd_219.bb
>> @@ -60,9 +60,89 @@ LDFLAGS_append_libc-uclibc = " -lrt"
>>   GTKDOC_DOCDIR = "${S}/docs/"
>
>>   PACKAGECONFIG ??= "xz ldconfig \
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'gcrypt', 'gcrypt', "", d)} \
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'kmod', 'kmod', "", d)} \
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'blkid', 'blkid', '', d)} \
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'efi', 'efi', '', d)} \
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'lz4', 'lz4', '', d)} \
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'libidn', 'libidn', '', d)} \
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
>>                      ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
>> -                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)}"
>> -
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'glib', 'glib', '', d)} \
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'blkid', 'blkid', '', d)} \
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'efi', 'efi', '', d)} \
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'kmod', 'kmod', '', d)} \
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'polkit', '', d)} \
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'smack', 'smack', '', d)} \
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'ima', 'ima', '', d)} \
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'apparmor', 'apparmor', '', d)} \
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'seccomp', '', d)} \
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'qrencode', 'qrencode', '', d)} \
>
> NAK.
>
> I like the split of systemd into smaller packages, but NAK for this
> version. We're not going to add all this to DISTRO_FEATURES...
>
> Add all the PACKAGCONFIG options, but enable only those that either were
> enabled before, or where we have a real DISTRO_FEATURE to check for.
> Dpn't add a new DISTRO_FEATURE for every PACKAGECONFIG.
>

Just to have it documented here via ML, Anders and I talked on IRC
and we agreed to add PACKAGECONFIG[feature] definitions for both
features and have the "current features" enabled by default without
using  DISTRO_FEATURES - since we don't want to add these
DISTRO_FEATURES.

For distros wanting to use the "new packages/features" we do so by
adding PACKAGECONFIG_pn-systemd... on the distro side.

Regards...

--
Dorileo

