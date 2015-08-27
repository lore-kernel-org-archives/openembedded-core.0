Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 630D273217
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 04:27:20 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 26 Aug 2015 21:27:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,420,1437462000"; d="scan'208";a="633044175"
Received: from dmsirur-mobl1.amr.corp.intel.com (HELO [10.252.23.82])
	([10.252.23.82])
	by orsmga003.jf.intel.com with ESMTP; 26 Aug 2015 21:27:17 -0700
User-Agent: Microsoft-MacOutlook/14.5.4.150722
Date: Thu, 27 Aug 2015 07:27:14 +0300
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Mark Hatle <mark.hatle@windriver.com>,
	<openembedded-core@lists.openembedded.org>
Message-ID: <D2046695.577C6%markus.lehtonen@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 3/3] package_manager: support for signed RPM
	package feeds
References: <1440587914-1280-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1440587914-1280-4-git-send-email-markus.lehtonen@linux.intel.com>
	<55DDD6F6.7090800@windriver.com>
In-Reply-To: <55DDD6F6.7090800@windriver.com>
Mime-version: 1.0
Subject: Re: [PATCH 3/3] package_manager: support for signed RPM package feeds
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
X-List-Received-Date: Thu, 27 Aug 2015 04:27:21 -0000
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit

Hi Mark,

On 26/08/15 18:10, "Mark Hatle" <mark.hatle@windriver.com> wrote:

>On 8/26/15 6:18 AM, Markus Lehtonen wrote:
>> This change makes it possible to create GPG signed RPM package feeds -
>> i.e. package feed with GPG signed metadata (repodata). All deployed RPM
>> repositories will be signed and the GPG public key is copied to the rpm
>> deployment directory.
>> 
>> In order to enable the new feature one needs to define four variables in
>> bitbake configuration.
>> 1. 'PACKAGE_FEED_SIGN = "1"' enabling the feature
>> 2. 'PACKAGE_FEED_GPG_NAME = "<key_id>"' defining the GPG key to use for
>>    signing
>> 3. 'PACKAGE_FEED_GPG_PASSPHRASE_FILE = "<path_to_file>"' pointing to a
>>    file containing the passphrase for the secret signing key
>> 4. 'PACKAGE_FEED_GPG_PUBKEY = "<path_to_pubkey>"' pointing to the
>>    corresponding public key (in "armor" format)
>> 
>> [YOCTO #8134]
>> 
>> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
>> ---
>>  meta/lib/oe/package_manager.py | 24 ++++++++++++++++++++++--
>>  1 file changed, 22 insertions(+), 2 deletions(-)
>> 
>> diff --git a/meta/lib/oe/package_manager.py
>>b/meta/lib/oe/package_manager.py
>> index 753b3eb..5d7ef54 100644
>> --- a/meta/lib/oe/package_manager.py
>> +++ b/meta/lib/oe/package_manager.py
>> @@ -113,8 +113,15 @@ class RpmIndexer(Indexer):
>>              rpm_pubkey = self.d.getVar('RPM_GPG_PUBKEY', True)
>>          else:
>>              rpm_pubkey = None
>> +        if self.d.getVar('PACKAGE_FEED_SIGN', True) == '1':
>> +            pkgfeed_gpg_name = self.d.getVar('PACKAGE_FEED_GPG_NAME',
>>True)
>> +            pkgfeed_gpg_pass =
>>self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True)
>> +        else:
>> +            pkgfeed_gpg_name = None
>> +            pkgfeed_gpg_pass = None
>>  
>>          index_cmds = []
>> +        repo_sign_cmds = []
>>          key_import_cmds = []
>>          rpm_dirs_found = False
>>          for arch in archs:
>> @@ -126,10 +133,16 @@ class RpmIndexer(Indexer):
>>                  continue
>>  
>>              if rpm_pubkey:
>> -                key_import_cmds.append("%s --define '_dbpath %s'
>>--import %s" %
>> +                key_import_cmds.append("%s --dbpath '%s' --import %s" %
>>                                     (rpm_bin, dbpath, rpm_pubkey))
>>              index_cmds.append("%s --dbpath %s --update -q %s" % \
>>                               (rpm_createrepo, dbpath, arch_dir))
>> +            if pkgfeed_gpg_name:
>> +                repomd_file = os.path.join(arch_dir, 'repodata',
>>'repomd.xml')
>> +                gpg_cmd = "gpg2 --detach-sign --armor --batch --no-tty
>>--yes " \
>> +                          "--passphrase-file '%s' -u '%s' %s" % \
>> +                          (pkgfeed_gpg_pass, pkgfeed_gpg_name,
>>repomd_file)
>> +                repo_sign_cmds.append(gpg_cmd)
>
>I've had problems in the past hard coding 'gpg' or 'gpg2' as the name to
>use.
>
>Can we get this to be dynamic.. even if it's a system level define for
>what
>GPG/PGP program to use?

OK, I can introduce a new variable for defining this.


>Also I'd forgotten about it until there.  RPM has a similar variable to
>define
>the GPG program to use.  So using that variable (_signature) and
>defaulting to
>the same item would be a good idea.

I think this is not feasible as we're actually using the host's gpg(2)
here and rpm might not even be available.


Thanks,
   Markus



>(One such reason to do this is to write a wrapper that uses an alternative
>keychain for these keys....)
>
>>  
>>              rpm_dirs_found = True
>>  
>> @@ -145,10 +158,17 @@ class RpmIndexer(Indexer):
>>          result = oe.utils.multiprocess_exec(index_cmds, create_index)
>>          if result:
>>              bb.fatal('%s' % ('\n'.join(result)))
>> -        # Copy pubkey to repo
>> +        # Sign repomd
>> +        result = oe.utils.multiprocess_exec(repo_sign_cmds,
>>create_index)
>> +        if result:
>> +            bb.fatal('%s' % ('\n'.join(result)))
>> +        # Copy pubkey(s) to repo
>>          if self.d.getVar('RPM_SIGN_PACKAGES', True) == '1':
>>              shutil.copy2(self.d.getVar('RPM_GPG_PUBKEY', True),
>>                           os.path.join(self.deploy_dir,
>>'RPM-GPG-KEY-oe'))
>> +        if self.d.getVar('PACKAGE_FEED_SIGN', True) == '1':
>> +            shutil.copy2(self.d.getVar('PACKAGE_FEED_GPG_PUBKEY',
>>True),
>> +                         os.path.join(self.deploy_dir,
>>'REPODATA-GPG-KEY'))
>
>I didn't notice this before..  but we shouldn't hardcode RPM-GPG-KEY-oe,
>it
>should use a value such as 'DISTRO' to allow different distributions to
>have
>non-conflicting keys.  The repository keys I would think would be similar
>as
>well.. since you may have multiple repositories from different sources.
>So
>naming the key ending in -${DISTRO} might be a good idea there as well.
>(Extending it to ${DISTRO_VERSION} might be make sense... since these
>will be
>used for long-term upgradable systems.)
>
>--Mark
>
>>  
>>  
>>  class OpkgIndexer(Indexer):
>> 
>



