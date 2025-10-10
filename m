Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3452FCCA476
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 08:04:45 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.3931.1760083475410574073
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 01:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fjwOKqol;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6399706fd3cso2797374a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 01:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760083474; x=1760688274; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7/jgyV/LeJZXCjdGTDrLcGMtT3EF3OASYN+bMvn/jkk=;
        b=fjwOKqol8fE9kUx58Cjuwo2YUSvHl6GE/NOq0pB0dZnqzw95Mk6l2DeSsC/NRJdk1l
         lFwM68ZQX3cTkA22HFSpDrxRp3OgAqBCjHNZI4En255IOx8xZtehCdcXfbXUdbWI+1/b
         DdBQzIPM/0jINRrvlvIPA/O1nxcfJregyK53aHVwP8jhcbuAFMC/zBzmT73alsPT3I78
         dseWeI70ZIBBvJPPHkQXsuCoULyk4SAn+QwIWa46cPSvIpUY505q+kiLiovB1wJ6yIj3
         E86QnMdtCl0iiJlFQ08tM6szI+bxuI7QmbKpFSBAd9tfQh3bakjX7o+DAQ+7h88njve7
         PSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760083474; x=1760688274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7/jgyV/LeJZXCjdGTDrLcGMtT3EF3OASYN+bMvn/jkk=;
        b=E7AncN84JjY8/Meuxnh8pnv80UTInf0OHFvn+O35WgjjmGiskU5JYNwlItf5FEhFgl
         VQ3dDufDgCJmvdTnl6alK2KwewD7dVSlqdY+2TY0YajG3I+5dmZ0LMRASDM3kZ+uGZFZ
         UTtV2C8TtnmYZkaBwVL8jP5IK9du5e6Z4YFck5UiPcsBV2OUq3sAQyvQRWnivtLSbTzW
         /T8X+dXmo2rbc/xOEsMGlE/uVjr5+9QicbpNoJdBfbMfMllnYf3c6yh95E0DFd0ex2A/
         QgKOdIo80aYnjumrUeswRh4CloWl3yXEwqZq7tZWAlXSSMcTVoBsw8JuFhrOxOkgOic/
         gaXg==
X-Forwarded-Encrypted: i=1; AJvYcCWDxgALNrvVssF0YDSunXjkYyFM3mVGM+BdVO9oimiZ3CfwXHa4+ByJezj4aRcL6p15Sa1IPLn4TgzdLgI6Q0qztA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxxofsNoREeFBpo8QftKJc7PqC8VGbfqXKefTj5cPOWZqEmtj2p
	UDABoBO1oJbys6TvC+ry1gC+igjUAfKp2LTUvE5re+LmjgNSaBbDJXCm
X-Gm-Gg: ASbGnctzJWI6P+AtwBW3GbNQhvOCN+QEn2oEC3tAjLCunXAkRHHZWKQbuyoHE5FCfO6
	BwyBeBNuSL3rbnR2ju50SqzpjMvpiGqE7zlS9S/6IWfyLyzrpld14rR4CRySMY9gSxDh5+3TP/Q
	pRDZj0+BdBCvlUZfSxgQYBCS4HNU9nH9MdMMVBdEofzGVTVEP7BzURMW90N8JKfnrhMQhk48qZz
	XxSE0FB/Lh1ge/Wf8PzVhsPTtD3ecxJFpZcUZ68SDN4o6ASoY8kCn3j5lUEspZS8YeUlfA7GXPI
	ZyPRcAwfxpF+6+3T1Yqxc/+qVK32poMMtFJn4oxDpWfLa0vJ/vwRVUtYgAmdhd/49IXwi0homLc
	NzCsTtiEjgr3Hnfzv0oH/IHHNCRnHJq2SR/eULx0qTICTcry1tSHVm4r5rzYN
X-Google-Smtp-Source: AGHT+IES1OaQZ7fFT9a17CcPfrKVA9QDSzezhDzLJp++5puY37ObRGlwmpbk1CaenbvKufFoQNAWZA==
X-Received: by 2002:a05:6402:518a:b0:634:5722:cc3f with SMTP id 4fb4d7f45d1cf-639d5b912d2mr10498785a12.16.1760083473242;
        Fri, 10 Oct 2025 01:04:33 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c133f58sm1687525a12.30.2025.10.10.01.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 01:04:32 -0700 (PDT)
Message-ID: <2e82bf39-47c4-416f-a7f4-783be8bd32d5@gmail.com>
Date: Fri, 10 Oct 2025 10:04:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH] cargo_common.bbclass: use source
 replacement instead of dependency patching
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
 openembedded-core@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
References: <20251003213000.2256939-1-skandigraun@gmail.com>
 <211549e4-c4c2-464d-9b63-88c27d5bdf18@weidmueller.com>
 <049f87a6-2e45-43b2-b04a-7b96e6cdb096@gmail.com>
 <54596a81-b725-4d78-9c35-ff851e4b1113@weidmueller.com>
 <239994b8-47de-4394-bcf0-16dc91ca654e@gmail.com>
 <6f3eedff-44c0-48ca-86dc-c1ea8aecc9e0@weidmueller.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <6f3eedff-44c0-48ca-86dc-c1ea8aecc9e0@weidmueller.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 08:04:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224672

On 10/10/25 08:27, Stefan Herbrechtsmeier wrote:
> Am 09.10.2025 um 16:30 schrieb Gyorgy Sarvari:
>> On 10/9/25 11:31, Stefan Herbrechtsmeier wrote:
>>> Am 08.10.2025 um 13:01 schrieb Gyorgy Sarvari:
>>>> On 10/7/25 16:59, Stefan Herbrechtsmeier wrote:
>>>>> Am 03.10.2025 um 23:30 schrieb Gyorgy Sarvari via lists.openembedded.org:
>>>>>> Cargo.toml files usually contain a list of dependencies in one of two forms:
>>>>>> either a crate name that can be fetched from some registry (like crates.io), or
>>>>>> as a source crate, which is most often fetched from a git repository.
>>>>>>
>>>>>> Normally cargo handles fetching the crates from both the registry and from git,
>>>>>> however with Yocto this task is taken over by Bitbake.
>>>>>>
>>>>>> After fetching these crates, they are made available to cargo by adding the location
>>>>>> to $CARGO_HOME/config.toml. The source crates are of interest here: each git repository
>>>>>> that can be found in the SRC_URI is added as one source crate.
>>>>>>
>>>>>> This works most of the time, as long as the repository really contains one crate only.
>>>>>>
>>>>>> However in case the repository is a cargo workspace, it contains multiple crates in
>>>>>> different subfolders, and in order to allow cargo to process them, they need to be
>>>>>> listed separately. This is not happening with the current implementation of cargo_common.
>>>>>>
>>>>>> This change introduces the following:
>>>>>> - instead of patching the dependencies, use source replacement (the primary motivation for
>>>>>>    this was that maturin seems to ignore source crate patches from config.toml)
>>>>>> - the above also allows to keep the original Cargo.lock untouched (the original implementation
>>>>>>    deleted git repository lines from it)
>>>>>> - it adds a new folder, currently ${UNPACKDIR}/yocto-vendored-source-crates. During processing
>>>>>>    the separate crate folders are copied into this folder, and it is used as the central
>>>>>>    vendoring folder. This is needed for source replacements: the folder that is used for
>>>>>>    vendoring needs to contain the crates separately, one crate in one folder. Each folder
>>>>>>    has the name of the crate that it contains. Workspaces are not included here (unless the
>>>>>>    given manifest is a workspace AND a package at once)
>>>>>> - previuosly the SRC_URI had to contain a "name" and a "destsuffix" parameter to be considered
>>>>>>    to be a rust crate. The name is not derived from the Cargo.toml file, not from the SRC_URI.
>>>>>>    Having destsuffix is still mandatory though.
>>>>>>
>>>>>> The change does not handle nested workspaces, only the top level Cargo.toml is processed.
>>>>> I use a similar approach for my Cargo.lock fetcher. In my case the code 
>>>>> finds the crate on the fly inside the a git repository because the 
>>>>> Cargo.lock doesn't contain the subpath.
>>>> By any chance, did you manage to solve the workspace problem? If you
>>>> have a working solution, feel free to submit it, I wouldn't mind if I
>>>> wouldn't have to debug mine :D
>>> I haven't test a workspace project. Do you have an example project?
>>>
>> I have attached a sample recipe (that is very much based on Tom Geelen's
>> initial work). It depends on at least 2 workspaces.
>
> Thanks for the sample. After switching to my cargolock fecher and
> cargo_vendor class the project build without problems. Your git URLs
> need a parameter to inform the config generate that the source
> contains a rev query parameter. Additionally you need to add the
> revision to the name and destsuffix/subdir because it is possible to
> use crates with different revisions from the same repository.
>

Yes, but the name and destsuffix already need to be always unique by
definition for each SRC_URI component. If name isn't unique, then you
can't specify different revisions. And git fetcher (and I suspect others
too) starts fetching with deleting the target folder, so if destsuffix
isn't unique, then only the last code prevails. If this should be
enforced, I would rather put that logic into a new QA check, or maybe
into the fetcher directly.

(A bit more touched on your note below)

>>>>>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>>>>>> Cc: Tom Geelen <t.f.g.geelen@gmail.com>
>>>>>>
>>>>>> ---
>>>>>>   meta/classes-recipe/cargo_common.bbclass | 158 ++++++++++++++++-------
>>>>>>   1 file changed, 108 insertions(+), 50 deletions(-)
>>>>>>
>>>>>> diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
>>>>>> index c9eb2d09a5..79c1351298 100644
>>>>>> --- a/meta/classes-recipe/cargo_common.bbclass
>>>>>> +++ b/meta/classes-recipe/cargo_common.bbclass
>>>>>> @@ -129,6 +129,44 @@ cargo_common_do_configure () {
>>>>>>   python cargo_common_do_patch_paths() {
>>>>>>       import shutil
>>>>>>   
>>>>>> +    def is_rust_crate_folder(path):
>>>>>> +        cargo_toml_path = os.path.join(path, 'Cargo.toml')
>>>>>> +        return os.path.exists(cargo_toml_path)
>>>>>> +
>>>>>> +    def load_toml_file(toml_path):
>>>>>> +        import tomllib
>>>>>> +        with open(toml_path, 'rb') as f:
>>>>>> +            toml = tomllib.load(f)
>>>>>> +        return toml
>>>>>> +
>>>>>> +    def get_matching_repo_from_lockfile(lockfile_repos, repo, revision):
>>>>>> +        for lf_repo in lockfile_repos.keys():
>>>>>> +            if repo in lf_repo and lf_repo.endswith(revision):
>>>>> Does this works if the URL contains a "rev" query parameter? This 
>>>>> happens if the same git repository is used with different revisions.
>>>> I *think* yes, since I query the revision from the fetcher, instead of
>>>> parsing it myself (and I use both the repo and revision for matching the
>>>> cargo.lock repos). But will test it specifically, and make it work if it
>>>> wouldn't work out of the box. Thanks for calling my attention on this.
>>> The problem is that the source replacement key contains a query
>>> parameter. The query isn't supported by the git fetcher. That means
>>> you have to remove the query from the SRC_URI but add it back in the
>>> source entry in the config.toml.
>> You mean for dynamic fetching, from Cargo.lock? This patch still relies
>> on the user adding these dependencies to the SRC_URI.
>> Otherwise I might be misunderstanding your question...
>
> Please check the source inside the Cargo.lock:
> https://github.com/astral-sh/uv/blob/0.8.19/Cargo.lock#L302
>
> It contains a rev query parameter. This query parameter must be part
> of the source key inside the config.toml:
>
> [source."git+https://github.com/astral-sh/rs-async-zip?rev=285e48742b74ab109887d62e1ae79e7c15fd4878"]
>
>

Yes, it supposed to work like that already. The
extract_git_repos_from_lockfile() collects the repos starting with
"git+" from Cargo.lock - this value contains the rev parameter already.
These values are only used as keys in the config.toml file, just like
your example. Before adding it to config.toml, only the last optional
part, the revision after the "#" is cut off. (E.g.
"git+https://github.com/foo?rev=123#123" becomes only
"git+https://github.com/foo?rev=123")

I do not use SRC_URI components in this file - currently there is some
loose connection between SRC_URI and Cargo.lock repos: at the end I try
to match each SRC_URI to a Cargo.lock repo, and see if the user has
fetched every required repo (by trying to match the repo URL and
revision), but in general the values are used differently.

>>>>>> +                lockfile_repos[lf_repo] = True
>>>>>> +                return lf_repo.split("#")[0]
>>>>>> +        bb.fatal('Cannot find %s (%s) repository from SRC_URI in Cargo.lock file' % (repo, revision))
>>>>>> +
>>>>>> +    def create_cargo_checksum(folder_path):
>>>>>> +        checksum_path = os.path.join(folder_path, '.cargo-checksum.json')
>>>>>> +        if os.path.exists(checksum_path):
>>>>>> +            return
>>>>>> +
>>>>>> +        import hashlib, json
>>>>>> +
>>>>>> +        checksum = {'files': {}}
>>>>>> +        for root, _, files in os.walk(folder_path):
>>>>>> +            for f in files:
>>>>>> +                full_path = os.path.join(root, f)
>>>>>> +                relative_path = os.path.relpath(full_path, folder_path)
>>>>>> +                if relative_path.startswith(".git/"):
>>>>>> +                    continue
>>>>>> +                with open(full_path, 'rb') as f2:
>>>>>> +                    file_sha = hashlib.sha256(f2.read()).hexdigest()
>>>>>> +                checksum["files"][relative_path] = file_sha
>>>>> Do we really need the calculation of the checksum?
>>>> For source replacement AFAIK it is mandatory, otherwise cargo complains.
>>>> (But I'd be happy to stand corrected)
>>> Have you test an empty dictionary for "files" and NULL for "package"?
>>>
>> Are these valid states? Currently the checksum calculation happens for
>> crate folders that have been actually copied to the vendor folder. And
>> that happens only, in case there is at least a Cargo.toml manifest in
>> that folder, so the files dict shouldn't be empty. Otherwise the
>> checksum sub iterates through all the files it can find, it doesn't try
>> to validate it against any manifests.
>
> Do we need the validation by cargo? The crate fetcher skip the
> validation with an empty dict and the same works for git sources.
>

Oh, you mean if there are no sources found that should be vendored? That
was definitely a bug in this version, and v2 should have a check for
that - if there is nothing to vendor than it stops and returns silently.

>>>>>> +
>>>>>> +        with open(checksum_path, 'w') as f:
>>>>>> +            json.dump(checksum, f)
>>>>>> +
>>>>>>       cargo_config = os.path.join(d.getVar("CARGO_HOME"), "config.toml")
>>>>>>       if not os.path.exists(cargo_config):
>>>>>>           return
>>>>>> @@ -137,66 +175,86 @@ python cargo_common_do_patch_paths() {
>>>>>>       if len(src_uri) == 0:
>>>>>>           return
>>>>>>   
>>>>>> -    patches = dict()
>>>>>> +    lockfile = d.getVar("CARGO_LOCK_PATH")
>>>>>> +    if not os.path.exists(lockfile):
>>>>>> +        bb.fatal(f"{lockfile} file doesn't exist")
>>>>>> +
>>>>>> +    lockfile = load_toml_file(lockfile)
>>>>>> +
>>>>>> +    # key is the repo url, value is a boolean, which is used later
>>>>>> +    # to indicate if there is a matching repository in SRC_URI also
>>>>>> +    lockfile_git_repos = {}
>>>>>> +    for p in lockfile['package']:
>>>>>> +        if 'source' in p and p['source'].startswith('git+'):
>>>>>> +            lockfile_git_repos[p['source']] = False
>>>>>> +
>>>>>> +    sources = dict()
>>>>>>       workdir = d.getVar('UNPACKDIR')
>>>>>>       fetcher = bb.fetch2.Fetch(src_uri, d)
>>>>>> +
>>>>>> +    vendor_folder = os.path.join(workdir, 'yocto-vendored-source-crates')
>>>>>> +
>>>>>> +    os.makedirs(vendor_folder)
>>>>>> +
>>>>>>       for url in fetcher.urls:
>>>>>>           ud = fetcher.ud[url]
>>>>>> -        if ud.type == 'git' or ud.type == 'gitsm':
>>>>>> -            name = ud.parm.get('name')
>>>>>> -            destsuffix = ud.parm.get('destsuffix')
>>>>>> -            if name is not None and destsuffix is not None:
>>>>>> -                if ud.user:
>>>>>> -                    repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
>>>>>> -                else:
>>>>>> -                    repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
>>>>>> -                path = '%s = { path = "%s" }' % (name, os.path.join(workdir, destsuffix))
>>>>>> -                patches.setdefault(repo, []).append(path)
>>>>>> +        if ud.type != 'git' and ud.type != 'gitsm':
>>>>>> +            continue
>>>>>>   
>>>>>> -    with open(cargo_config, "a+") as config:
>>>>>> -        for k, v in patches.items():
>>>>>> -            print('\n[patch."%s"]' % k, file=config)
>>>>>> -            for name in v:
>>>>>> -                print(name, file=config)
>>>>>> +        destsuffix = ud.parm.get('destsuffix')
>>>>>> +        crate_folder = os.path.join(workdir, destsuffix)
>>>>>>   
>>>>>> -    if not patches:
>>>>>> -        return
>>>>>> +        if destsuffix is None or not is_rust_crate_folder(crate_folder):
>>>>>> +            continue
>>>>>>   
>>>>>> -    # Cargo.lock file is needed for to be sure that artifacts
>>>>>> -    # downloaded by the fetch steps are those expected by the
>>>>>> -    # project and that the possible patches are correctly applied.
>>>>>> -    # Moreover since we do not want any modification
>>>>>> -    # of this file (for reproducibility purpose), we prevent it by
>>>>>> -    # using --frozen flag (in CARGO_BUILD_FLAGS) and raise a clear error
>>>>>> -    # here is better than letting cargo tell (in case the file is missing)
>>>>>> -    # "Cargo.lock should be modified but --frozen was given"
>>>>>> +        if ud.user:
>>>>>> +            repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
>>>>>> +        else:
>>>>>> +            repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
>>>>>>   
>>>>>> -    lockfile = d.getVar("CARGO_LOCK_PATH")
>>>>>> -    if not os.path.exists(lockfile):
>>>>>> -        bb.fatal(f"{lockfile} file doesn't exist")
>>>>>> +        sources[destsuffix] = (repo, ud.revision, crate_folder)
>>>>>> +
>>>>>> +        cargo_toml_path = os.path.join(workdir, destsuffix, 'Cargo.toml')
>>>>>> +        cargo_toml = load_toml_file(cargo_toml_path)
>>>>>> +
>>>>>> +        if 'workspace' in cargo_toml:
>>>>>> +            members = cargo_toml['workspace']['members']
>>>>>> +            for member in members:
>>>>>> +                member_crate_folder = os.path.join(workdir, destsuffix, member)
>>>>>> +                member_crate_cargo_toml = os.path.join(member_crate_folder, 'Cargo.toml')
>>>>>> +                member_cargo_toml = load_toml_file(member_crate_cargo_toml)
>>>>>> +                member_crate_name = member_cargo_toml['package']['name']
>>>>>> +                shutil.copytree(member_crate_folder, os.path.join(vendor_folder, member_crate_name))
>>>>>> +
>>>>>> +        if 'package' in cargo_toml:
>>>>>> +            crate_folder = os.path.join(workdir, destsuffix)
>>>>>> +            crate_name = cargo_toml['package']['name']
>>>>>> +            shutil.copytree(crate_folder, os.path.join(vendor_folder, crate_name))
>>>>>> +
>>>>>> +    for d in os.scandir(vendor_folder):
>>>>>> +        if d.is_dir():
>>>>>> +            create_cargo_checksum(d.path)
>>>>>> +
>>>>>> +
>>>>>> +    with open(cargo_config, "a+") as config:
>>>>>> +        print('\n[source."yocto-vendored-sources"]', file=config)
>>>>>> +        print('directory = "%s"' % vendor_folder, file=config)
>>>>>> +
>>>>>> +        for destsuffix, (repo, revision, repo_path) in sources.items():
>>>>>> +            lockfile_repo = get_matching_repo_from_lockfile(lockfile_git_repos, repo, revision)
>>>>>> +            print('\n[source."%s"]' % lockfile_repo, file=config)
>>>>>> +            print('git = "%s"' % repo, file=config)
>>>>>> +            print('rev = "%s"' % revision, file=config)
>>>>>> +            print('replace-with = "yocto-vendored-sources"', file=config)
>>>>>> +
>>>>>> +    # check if there are any git repos in the lock file that were not visited
>>>>>> +    # in the previous loop, when the source replacement was created, and warn about it
>>>>>> +    for lf_repo, found_in_src_uri in lockfile_git_repos.items():
>>>>>> +        if not found_in_src_uri:
>>>>>> +            bb.warn(f"{lf_repo} is present in lockfile, but not found in SRC_URI")
>>>>>>   
>>>>>> -    # There are patched files and so Cargo.lock should be modified but we use
>>>>>> -    # --frozen so let's handle that modifications here.
>>>>>> -    #
>>>>>> -    # Note that a "better" (more elegant ?) would have been to use cargo update for
>>>>>> -    # patched packages:
>>>>>> -    #  cargo update --offline -p package_1 -p package_2
>>>>>> -    # But this is not possible since it requires that cargo local git db
>>>>>> -    # to be populated and this is not the case as we fetch git repo ourself.
>>>>>> -
>>>>>> -    lockfile_orig = lockfile + ".orig"
>>>>>> -    if not os.path.exists(lockfile_orig):
>>>>>> -        shutil.copy(lockfile, lockfile_orig)
>>>>>> -
>>>>>> -    newlines = []
>>>>>> -    with open(lockfile_orig, "r") as f:
>>>>>> -        for line in f.readlines():
>>>>>> -            if not line.startswith("source = \"git"):
>>>>>> -                newlines.append(line)
>>>>>> -
>>>>>> -    with open(lockfile, "w") as f:
>>>>>> -        f.writelines(newlines)
>>>>>>   }
>>>>>> +
>>>>>>   do_configure[postfuncs] += "cargo_common_do_patch_paths"
>>>>>>   
>>>>>>   do_compile:prepend () {
>>>>>>
>>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>>> Links: You receive all messages sent to this group.
>>>>>> View/Reply Online (#224426): https://lists.openembedded.org/g/openembedded-core/message/224426
>>>>>> Mute This Topic: https://lists.openembedded.org/mt/115578466/6374899
>>>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [stefan.herbrechtsmeier-oss@weidmueller.com]
>>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>>>


