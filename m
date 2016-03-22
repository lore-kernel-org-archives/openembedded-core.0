Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3B4E462132
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 17:14:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 22 Mar 2016 10:14:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,378,1455004800"; d="scan'208";a="939325146"
Received: from unknown (HELO [10.252.9.96]) ([10.252.9.96])
	by orsmga002.jf.intel.com with ESMTP; 22 Mar 2016 10:14:05 -0700
User-Agent: Microsoft-MacOutlook/0.0.0.160212
Date: Tue, 22 Mar 2016 19:14:03 +0200
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <9A58CABD-70B7-44A4-BFE5-C42A79341193@linux.intel.com>
Thread-Topic: [OE-core] [PATCH v2] externalsrc.bbclas: remove nostamp from
	do_configure
References: <1456410587-7337-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1456410587-7337-2-git-send-email-markus.lehtonen@linux.intel.com>
	<10265580.5bu4Qb5tF3@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <10265580.5bu4Qb5tF3@peggleto-mobl.ger.corp.intel.com>
Mime-version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] externalsrc.bbclas: remove nostamp from do_configure
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
X-List-Received-Date: Tue, 22 Mar 2016 17:14:05 -0000
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: 7bit

Hi Paul,



On 08/03/16 07:03, "Paul Eggleton" <paul.eggleton@linux.intel.com> wrote:

>Hi Markus,
>
>On Thu, 25 Feb 2016 16:29:47 Markus Lehtonen wrote:
>> Be a bit more intelligent than mindlessly re-compiling every time.
>> Instead of using 'nostamp' flag for do_compile run a python function to
>> get a list of files to add as 'file-checksums' flag.  The intention is
>> to only re-run do_compile if something in the source tree content
>> changes.
>> 
>> This python function, srctree_hash_files(), works differently, depending
>> if the source tree is a git repository clone or not. If the source tree
>> is a git repository, the function runs 'git add .' with a custom git
>> index file in order to record all changes in the git working tree. This
>> custom index file is then returned as the file for the task to depend
>> on. The index file is changed if any changes are made in the source tree
>> causing the task to be re-run.
>> 
>> If the source tree is not a git repository, srctree_hash_files() simply
>> adds the whole source tree as a dependency, causing bitbake to basically
>> hash every file in it. Hidden files and directories in the source tree
>> root are ignored by the glob currently used. This has the advantage of
>> automatically ignoring .git directory, for example.
>> 
>> This method of tracking changes source tree changes to determine if
>> re-build is needed does not work perofectly, though. Many packages are
>> built under ${S} which effectively changes the source tree causing some
>> unwanted re-compilations.  However, if do_compile of the recipe does not
>> produce new/different artefacts on every run (as commonly is and should
>> be the case) the re-compilation loop stops. Thus, you should usually see
>> only one re-compilation (if any) after which the source tree is
>> "stabilized" and no more re-compilations happen.
>> 
>> During the first bitbake run preparing of the task runqueue may take
>> much longer if the source tree is not a git repository. The reason is
>> that all the files in the source tree are hashed.  Subsequent builds are
>> not significantly slower because (most) file hashes are found from the
>> cache.
>> 
>> [YOCTO #8853]
>> 
>> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
>> ---
>>  meta/classes/externalsrc.bbclass | 25 +++++++++++++++++++++++--
>>  1 file changed, 23 insertions(+), 2 deletions(-)
>> 
>> diff --git a/meta/classes/externalsrc.bbclass
>> b/meta/classes/externalsrc.bbclass index b608bd0..4f25bcf 100644
>> --- a/meta/classes/externalsrc.bbclass
>> +++ b/meta/classes/externalsrc.bbclass
>> @@ -85,8 +85,7 @@ python () {
>>          d.prependVarFlag('do_compile', 'prefuncs',
>> "externalsrc_compile_prefunc ") d.prependVarFlag('do_configure',
>> 'prefuncs', "externalsrc_configure_prefunc ")
>> 
>> -        # Ensure compilation happens every time
>> -        d.setVarFlag('do_compile', 'nostamp', '1')
>> +        d.setVarFlag('do_compile', 'file-checksums',
>> '${@srctree_hash_files(d)}')
>> 
>>          # We don't want the workdir to go away
>>          d.appendVar('RM_WORK_EXCLUDE', ' ' + d.getVar('PN', True))
>> @@ -125,3 +124,25 @@ python externalsrc_compile_prefunc() {
>>      # Make it obvious that this is happening, since forgetting about it
>> could lead to much confusion bb.plain('NOTE: %s: compiling from external
>> source tree %s' % (d.getVar('PN', True), d.getVar('EXTERNALSRC', True))) }
>> +
>> +def srctree_hash_files(d):
>> +    import shutil
>> +    import subprocess
>> +
>> +    s_dir = d.getVar('EXTERNALSRC', True)
>> +    git_dir = os.path.join(s_dir, '.git')
>> +    oe_index_file = os.path.join(git_dir, 'oe-devtool-index')
>> +
>> +    ret = " "
>> +    if os.path.exists(git_dir):
>> +        # Clone index
>> +        if not os.path.exists(oe_index_file):
>> +            shutil.copy2(os.path.join(git_dir, 'index'), oe_index_file)
>> +        # Update our custom index
>> +        env = os.environ.copy()
>> +        env['GIT_INDEX_FILE'] = oe_index_file
>> +        subprocess.check_output(['git', 'add', '.'], cwd=s_dir, env=env)
>> +        ret = oe_index_file + ':True'
>> +    else:
>> +        ret = d.getVar('EXTERNALSRC') + '/*:True'
>> +    return ret
>
>So I finally made the time to look at this - sorry for the extreme delay. There 
>are a few issues:

Thank you for the review. I'm sorry about the latest delay on my part. I had just
missed your email.

I just submitted a new version of the patchset. That should have the issues you
were seeing resolved. It now requires two patches to bitbake, too, though.



>1) Unfortunately this clashes with the EXTERNALSRC_SYMLINKS functionality - we 
>now create oe-logs and oe-workdir symlinks in the source directory, and these 
>will be picked up by the file-checksums resulting in either warnings or errors 
>when pseudo.socket goes missing. For git repositories we should probably be 
>poking these into .git/info/exclude somehow; but without a git repository I'm 
>unsure as to how to exclude them. It could be that we make things easy on 
>ourselves and only activate this functionality if the source tree is a git 
>repository and just fall back to the old behaviour if it isn't.

Yes, it does (or did). Generally, I don't like the idea of build system
dirtying/tampering with the source tree (unless B=S). But, I guess there's
not much I can do about that now.

For git trees the symlinks do not cause any problems for checksumming as Git
handles those. Even if they make the git tree dirty and devtool should add those
into .git/info/exclude. However, I think that is unrelated to this patchset and
could/should be done in a separate patchset.

My latest iteration fixes the symlink problem for non-Git trees by changing bitbake
checksumming code not to follow directory symlinks. If that is not seen feasible we
could try e.g. listing each file in the root directory as a dependency separately
(i.e. without using a glob) and filtering out symlinks there.



>2) If the source tree is a git repo then we always only add files to the custom 
>index; if you then realise your .gitignore isn't complete and add some items 
>to be ignored within it, those items are still in the custom index and thus 
>still get incorporated into the signature. Perhaps we need to be doing a git 
>reset for that index before git add each time?

This is now also fixed. In the new version a fresh copy of the "real" git index is
always used as a base for the custom index so this shouldn't be an issue anymore.



>3) Even with a git repository and a properly set up .gitignore such that I 
>could tell the index file's md5sum wasn't changing, I couldn't seem to get it 
>to work - it just built every time as before. I wonder if this has to do with 
>the CONFIGURESTAMPFILE functionality, since I noticed it's do_configure 
>executing every time.

Yes, this was caused by the semi-broken CONFIGURESTAMP functionality. It is
fixed in master, now.


Thanks,
   Markus



