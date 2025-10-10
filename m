Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68751CCA476
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 11:35:16 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.7132.1760096106051169328
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 04:35:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HreQymck;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b3d80891c6cso459838966b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 04:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760096104; x=1760700904; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EjAC1ez1xchHjfgvVqm3OrhcKDP0empGYQeRdetoQMw=;
        b=HreQymckk7WHIE7Dd5mrQ/kce2vegc9QDpd2q+Jga92d+r+Zvg5x9/HIdoXBPRQlU8
         ara8HZIwk2G/hTnRyUU1Ocbh6awUOFN99CtygLGuKfO0X656kYHLcXsP2inzgJEaADfM
         xNwUnW16W1zkgDJuUnbjZHHWT/NPMEpJszQeSknxvRFnB218utXSnt2S5HdFs2r9EDBr
         uAA3ACu32zwe5L1loR8/2WwokC9JuTiSWqwIlo++JhxXNA8vP+Gse6b/ZS/9slLjSkzn
         wpKHk4fQFy5XK4O+IqzCQ//kluiozvUDO/PnKUWyen54VxQdsDUuFYE2ZZUTjf/a+usR
         0n8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760096104; x=1760700904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EjAC1ez1xchHjfgvVqm3OrhcKDP0empGYQeRdetoQMw=;
        b=biReucGD3b0u9kU/NTbsOuAW2/ocesi0e4Piry2juHKukks8FRW9QQY1hyRfWuCkg2
         aZlarOhYxHDCL9NYYl/uOA9INlpJDgly0LkoKJl45XpVG7SXPvflHo52QbKaU5U5XDkp
         sHmERubxacqeLbX28jZuckmPpAmHGPIhWSDm92qSjW1R8yFxySHv/T5AF19AItFhgul7
         a69Z3NGiHAQoAtepFccmVj4mmNB113IMs1XsSnPauVlyHk0w6N4Li3V/5cTUy8ycfuGP
         CVMXSg1lpvWwkbfIn2ZHcn82EjAk1sIiyJpXbUGH92MDXpsF28T/D66TouD3sMHTGTDU
         plPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj8KTDVoOwIb8bu4rFLjB75Gbh70vuvk0ZJ9J6f3GyRMLUlAqJpfvYjNYXfcoetvYKFg/OEJevUZ4rSAKnjd9AAQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxpBmrjrKGtGOisj728cjva64pHZSz+nndjuJ7CNGTK7LPaJGAK
	rQrpjRWlmMyuKbHE0ZkZgV1zVMg8u5ZHpPLTOwtcPqb0mO+ss6kdekY7
X-Gm-Gg: ASbGncsrKBgSb7XyKSIUZpt9ucNIHY9DhAbwhAymToDFyaeuJV0u1rroThJ1RGOd/RL
	MllsAmlcjPIEmOxM9LbrRpdXcNjEFXdKe7yaM3MVEt1SVy65v5iqeUwrIvOaA7IL3dObITAWa5M
	Tbu9n3s8VlflKI7GchzNrZ7j5eaoanYwFMP/YTapr4Pt3rv3qtNqQGzToc2hq9sTlVOhTO8jQ+r
	CGD+KxM4WButbz3pZUQsEX4uN4GCE2067U5NxxLC/j6ew44NlDifQKZE4xldvnt9uPjYWfGJ6ML
	Isercl3V6MLWXG89VAUMKNbKnA3lFg0AHnSyCcwW5n0gMZGSyzRp9Gdt1FA1y4sAVD8dvGRXfYb
	oB6osiDyBwNOoxIc8W5QE3zzXcfRxvsW4rGtGn1awWwcU9etAUQ==
X-Google-Smtp-Source: AGHT+IGRbvZCE4k5eIBEYNxA3WCoVzEJXR+fKs/8p7QSWJUaC2H5SBSsxMOh2chA6Q6zWps13av4RA==
X-Received: by 2002:a17:906:6a1f:b0:b04:3cd2:265b with SMTP id a640c23a62f3a-b50bcc09d8dmr1290288766b.5.1760096103985;
        Fri, 10 Oct 2025 04:35:03 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d61ccb09sm205537266b.19.2025.10.10.04.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 04:35:03 -0700 (PDT)
Message-ID: <07f2daa3-b311-4247-87eb-ad404f2af24b@gmail.com>
Date: Fri, 10 Oct 2025 13:35:02 +0200
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
 <2e82bf39-47c4-416f-a7f4-783be8bd32d5@gmail.com>
 <f918694b-93e8-46de-bd3b-d9556563aec3@weidmueller.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <f918694b-93e8-46de-bd3b-d9556563aec3@weidmueller.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 11:35:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224678



On 10/10/25 12:38, Stefan Herbrechtsmeier wrote:
> Am 10.10.2025 um 10:04 schrieb Gyorgy Sarvari:
>> On 10/10/25 08:27, Stefan Herbrechtsmeier wrote:
>>> Am 09.10.2025 um 16:30 schrieb Gyorgy Sarvari:
>>>> On 10/9/25 11:31, Stefan Herbrechtsmeier wrote:
>>>>> Am 08.10.2025 um 13:01 schrieb Gyorgy Sarvari:
>>>>>> On 10/7/25 16:59, Stefan Herbrechtsmeier wrote:
>>>>>>> Am 03.10.2025 um 23:30 schrieb Gyorgy Sarvari via lists.openembedded.org:
>>>>>>>> Cargo.toml files usually contain a list of dependencies in one of two forms:
>>>>>>>> either a crate name that can be fetched from some registry (like crates.io), or
>>>>>>>> as a source crate, which is most often fetched from a git repository.
>>>>>>>>
>>>>>>>> Normally cargo handles fetching the crates from both the registry and from git,
>>>>>>>> however with Yocto this task is taken over by Bitbake.
>>>>>>>>
>>>>>>>> After fetching these crates, they are made available to cargo by adding the location
>>>>>>>> to $CARGO_HOME/config.toml. The source crates are of interest here: each git repository
>>>>>>>> that can be found in the SRC_URI is added as one source crate.
>>>>>>>>
>>>>>>>> This works most of the time, as long as the repository really contains one crate only.
>>>>>>>>
>>>>>>>> However in case the repository is a cargo workspace, it contains multiple crates in
>>>>>>>> different subfolders, and in order to allow cargo to process them, they need to be
>>>>>>>> listed separately. This is not happening with the current implementation of cargo_common.
>>>>>>>>
>>>>>>>> This change introduces the following:
>>>>>>>> - instead of patching the dependencies, use source replacement (the primary motivation for
>>>>>>>>     this was that maturin seems to ignore source crate patches from config.toml)
>>>>>>>> - the above also allows to keep the original Cargo.lock untouched (the original implementation
>>>>>>>>     deleted git repository lines from it)
>>>>>>>> - it adds a new folder, currently ${UNPACKDIR}/yocto-vendored-source-crates. During processing
>>>>>>>>     the separate crate folders are copied into this folder, and it is used as the central
>>>>>>>>     vendoring folder. This is needed for source replacements: the folder that is used for
>>>>>>>>     vendoring needs to contain the crates separately, one crate in one folder. Each folder
>>>>>>>>     has the name of the crate that it contains. Workspaces are not included here (unless the
>>>>>>>>     given manifest is a workspace AND a package at once)
>>>>>>>> - previuosly the SRC_URI had to contain a "name" and a "destsuffix" parameter to be considered
>>>>>>>>     to be a rust crate. The name is not derived from the Cargo.toml file, not from the SRC_URI.
>>>>>>>>     Having destsuffix is still mandatory though.
>>>>>>>>
>>>>>>>> The change does not handle nested workspaces, only the top level Cargo.toml is processed.
>>>>>>> I use a similar approach for my Cargo.lock fetcher. In my case the code
>>>>>>> finds the crate on the fly inside the a git repository because the
>>>>>>> Cargo.lock doesn't contain the subpath.
>>>>>> By any chance, did you manage to solve the workspace problem? If you
>>>>>> have a working solution, feel free to submit it, I wouldn't mind if I
>>>>>> wouldn't have to debug mine :D
>>>>> I haven't test a workspace project. Do you have an example project?
>>>>>
>>>> I have attached a sample recipe (that is very much based on Tom Geelen's
>>>> initial work). It depends on at least 2 workspaces.
>>> Thanks for the sample. After switching to my cargolock fecher and
>>> cargo_vendor class the project build without problems. Your git URLs
>>> need a parameter to inform the config generate that the source
>>> contains a rev query parameter. Additionally you need to add the
>>> revision to the name and destsuffix/subdir because it is possible to
>>> use crates with different revisions from the same repository.
>>>
>> Yes, but the name and destsuffix already need to be always unique by
>> definition for each SRC_URI component. If name isn't unique, then you
>> can't specify different revisions. And git fetcher (and I suspect others
>> too) starts fetching with deleting the target folder, so if destsuffix
>> isn't unique, then only the last code prevails.
> It was only a comment, that the solution inside your example doesn't 
> work in any case.
>
> In your example the Cargo.lock reference two crates inside the same 
> repository:
>
> [[package]]
> name = "reqwest-middleware"
> version = "0.4.2"
> source = 
> "git+https://github.com/astral-sh/reqwest-middleware?rev=7650ed76215a962a96d94a79be71c27bffde7ab2#7650ed76215a962a96d94a79be71c27bffde7ab2"
>
> [[package]]
> name = "reqwest-retry"
> version = "0.7.0"
> source = 
> "git+https://github.com/astral-sh/reqwest-middleware?rev=7650ed76215a962a96d94a79be71c27bffde7ab2#7650ed76215a962a96d94a79be71c27bffde7ab2"
>
> (https://github.com/astral-sh/uv/blob/0.8.19/Cargo.lock#L3431)
>
> Luckily both use the same revision of the repository and you can use a 
> single SRC_URI:
>
> SRC_URI += 
> "git://github.com/astral-sh/reqwest-middleware;protocol=https;name=reqwest-middleware;destsuffix=reqwest-middleware;branch=main"
>
> If they use different revisions you have to add two SRC_URIs with 
> different name and destsuffix. Furthermore you need to add the crates 
> from the correct destsuffix to the vendor folder because both checkouts 
> can contain the same crates.
>
> I follow the cargo vendor approach and use a part of the revision inside 
> the subdir (destsuffix).
>
> SRC_URI += 
> "git://github.com/astral-sh/reqwest-middleware;protocol=https;nobranch=1;name=reqwest-middleware#7650ed7;destsuffix=cargo/git/checkouts/reqwest-middleware/7650ed7"
> SRC_URI += 
> "git://github.com/astral-sh/reqwest-middleware;protocol=https;nobranch=1;name=reqwest-middleware#591ab44;destsuffix=cargo/git/checkouts/reqwest-middleware/591ab44"

Hmmm... ooops. You are definitely right - I do break crates if they have
the same name, they are not differentiated and copied over each other.
Thanks a lot - will take care of it in next version.

Regarding the duplicated SRC_URI: yes, but that's on the user.

>> If this should be
>> enforced, I would rather put that logic into a new QA check, or maybe
>> into the fetcher directly.
>>
>> (A bit more touched on your note below)
>>
>>>>>>>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>>>>>>>> Cc: Tom Geelen <t.f.g.geelen@gmail.com>
>>>>>>>>
>>>>>>>> ---
>>>>>>>>    meta/classes-recipe/cargo_common.bbclass | 158 ++++++++++++++++-------
>>>>>>>>    1 file changed, 108 insertions(+), 50 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
>>>>>>>> index c9eb2d09a5..79c1351298 100644
>>>>>>>> --- a/meta/classes-recipe/cargo_common.bbclass
>>>>>>>> +++ b/meta/classes-recipe/cargo_common.bbclass
>>>>>>>> @@ -129,6 +129,44 @@ cargo_common_do_configure () {
>>>>>>>>    python cargo_common_do_patch_paths() {
>>>>>>>>        import shutil
>>>>>>>>    
>>>>>>>> +    def is_rust_crate_folder(path):
>>>>>>>> +        cargo_toml_path = os.path.join(path, 'Cargo.toml')
>>>>>>>> +        return os.path.exists(cargo_toml_path)
>>>>>>>> +
>>>>>>>> +    def load_toml_file(toml_path):
>>>>>>>> +        import tomllib
>>>>>>>> +        with open(toml_path, 'rb') as f:
>>>>>>>> +            toml = tomllib.load(f)
>>>>>>>> +        return toml
>>>>>>>> +
>>>>>>>> +    def get_matching_repo_from_lockfile(lockfile_repos, repo, revision):
>>>>>>>> +        for lf_repo in lockfile_repos.keys():
>>>>>>>> +            if repo in lf_repo and lf_repo.endswith(revision):
>>>>>>> Does this works if the URL contains a "rev" query parameter? This
>>>>>>> happens if the same git repository is used with different revisions.
>>>>>> I *think* yes, since I query the revision from the fetcher, instead of
>>>>>> parsing it myself (and I use both the repo and revision for matching the
>>>>>> cargo.lock repos). But will test it specifically, and make it work if it
>>>>>> wouldn't work out of the box. Thanks for calling my attention on this.
>>>>> The problem is that the source replacement key contains a query
>>>>> parameter. The query isn't supported by the git fetcher. That means
>>>>> you have to remove the query from the SRC_URI but add it back in the
>>>>> source entry in the config.toml.
>>>> You mean for dynamic fetching, from Cargo.lock? This patch still relies
>>>> on the user adding these dependencies to the SRC_URI.
>>>> Otherwise I might be misunderstanding your question...
>>> Please check the source inside the Cargo.lock:
>>> https://github.com/astral-sh/uv/blob/0.8.19/Cargo.lock#L302
>>>
>>> It contains a rev query parameter. This query parameter must be part
>>> of the source key inside the config.toml:
>>>
>>> [source."git+https://github.com/astral-sh/rs-async-zip?rev=285e48742b74ab109887d62e1ae79e7c15fd4878"]
>>>
>>>
>> Yes, it supposed to work like that already. The
>> extract_git_repos_from_lockfile() collects the repos starting with
>> "git+" from Cargo.lock - this value contains the rev parameter already.
>> These values are only used as keys in the config.toml file, just like
>> your example. Before adding it to config.toml, only the last optional
>> part, the revision after the "#" is cut off. (E.g.
>> "git+https://github.com/foo?rev=123#123" becomes only
>> "git+https://github.com/foo?rev=123")
> Okay, I use the SRC_URIs as source and therefore have the problem to 
> reconstruct the source key. The reason therefore where that I populate 
> the vendor folder during do_unpack. But the config.toml could be created 
> after do_patch and the Cargo.lock should be the better source.

Personally my main goal would be only to add workspace support to the
existing class without moving other pieces, but I think config.toml
creation could be moved after do_patch without big issues, I don't see
any obvious dependency problems.
I would still encourage you to submit your solution (if it is possible
to open-source it) - it sounds it has been used in real world builds.

>> I do not use SRC_URI components in this file - currently there is some
>> loose connection between SRC_URI and Cargo.lock repos: at the end I try
>> to match each SRC_URI to a Cargo.lock repo, and see if the user has
>> fetched every required repo (by trying to match the repo URL and
>> revision), but in general the values are used differently.
>>
>>>>>>>> +                lockfile_repos[lf_repo] = True
>>>>>>>> +                return lf_repo.split("#")[0]
>>>>>>>> +        bb.fatal('Cannot find %s (%s) repository from SRC_URI in Cargo.lock file' % (repo, revision))
>>>>>>>> +
>>>>>>>> +    def create_cargo_checksum(folder_path):
>>>>>>>> +        checksum_path = os.path.join(folder_path, '.cargo-checksum.json')
>>>>>>>> +        if os.path.exists(checksum_path):
>>>>>>>> +            return
>>>>>>>> +
>>>>>>>> +        import hashlib, json
>>>>>>>> +
>>>>>>>> +        checksum = {'files': {}}
>>>>>>>> +        for root, _, files in os.walk(folder_path):
>>>>>>>> +            for f in files:
>>>>>>>> +                full_path = os.path.join(root, f)
>>>>>>>> +                relative_path = os.path.relpath(full_path, folder_path)
>>>>>>>> +                if relative_path.startswith(".git/"):
>>>>>>>> +                    continue
>>>>>>>> +                with open(full_path, 'rb') as f2:
>>>>>>>> +                    file_sha = hashlib.sha256(f2.read()).hexdigest()
>>>>>>>> +                checksum["files"][relative_path] = file_sha
>>>>>>> Do we really need the calculation of the checksum?
>>>>>> For source replacement AFAIK it is mandatory, otherwise cargo complains.
>>>>>> (But I'd be happy to stand corrected)
>>>>> Have you test an empty dictionary for "files" and NULL for "package"?
>>>>>
>>>> Are these valid states? Currently the checksum calculation happens for
>>>> crate folders that have been actually copied to the vendor folder. And
>>>> that happens only, in case there is at least a Cargo.toml manifest in
>>>> that folder, so the files dict shouldn't be empty. Otherwise the
>>>> checksum sub iterates through all the files it can find, it doesn't try
>>>> to validate it against any manifests.
>>> Do we need the validation by cargo? The crate fetcher skip the
>>> validation with an empty dict and the same works for git sources.
>>>
>> Oh, you mean if there are no sources found that should be vendored? That
>> was definitely a bug in this version, and v2 should have a check for
>> that - if there is nothing to vendor than it stops and returns silently.
> I mean that we already ensure the integrity of our sources. Why should 
> we invest time to populate the files checksum if we could simple skip 
> the check inside cargo by an empty files dictionary.
>
> metadata['files'] = {}
> metadata['package'] = tarhash
>
> (https://github.com/openembedded/bitbake/blob/master/lib/bb/fetch2/crate.py#L120)
>
> Maybe we should even remove the .cargo-checksum.json creation from the 
> fetcher and move it into your function. We can speed up the process if 
> we use the checksum from the Cargo.lock instead of the on-the-fly 
> calculation inside the fetcher:
>
> tarhash = hashlib.sha256(f.read()).hexdigest()
>
> (https://github.com/openembedded/bitbake/blob/master/lib/bb/fetch2/crate.py#L118)

I haven't seen this part yet in the fetcher, but I can definitely look
into it for simplification. Thanks - will try to add it to the next version.

>>>>>>>> +
>>>>>>>> +        with open(checksum_path, 'w') as f:
>>>>>>>> +            json.dump(checksum, f)
>>>>>>>> +
>>>>>>>>        cargo_config = os.path.join(d.getVar("CARGO_HOME"), "config.toml")
>>>>>>>>        if not os.path.exists(cargo_config):
>>>>>>>>            return
>>>>>>>> @@ -137,66 +175,86 @@ python cargo_common_do_patch_paths() {
>>>>>>>>        if len(src_uri) == 0:
>>>>>>>>            return
>>>>>>>>    
>>>>>>>> -    patches = dict()
>>>>>>>> +    lockfile = d.getVar("CARGO_LOCK_PATH")
>>>>>>>> +    if not os.path.exists(lockfile):
>>>>>>>> +        bb.fatal(f"{lockfile} file doesn't exist")
>>>>>>>> +
>>>>>>>> +    lockfile = load_toml_file(lockfile)
>>>>>>>> +
>>>>>>>> +    # key is the repo url, value is a boolean, which is used later
>>>>>>>> +    # to indicate if there is a matching repository in SRC_URI also
>>>>>>>> +    lockfile_git_repos = {}
>>>>>>>> +    for p in lockfile['package']:
>>>>>>>> +        if 'source' in p and p['source'].startswith('git+'):
>>>>>>>> +            lockfile_git_repos[p['source']] = False
>>>>>>>> +
>>>>>>>> +    sources = dict()
>>>>>>>>        workdir = d.getVar('UNPACKDIR')
>>>>>>>>        fetcher = bb.fetch2.Fetch(src_uri, d)
>>>>>>>> +
>>>>>>>> +    vendor_folder = os.path.join(workdir, 'yocto-vendored-source-crates')
>>>>>>>> +
>>>>>>>> +    os.makedirs(vendor_folder)
>>>>>>>> +
>>>>>>>>        for url in fetcher.urls:
>>>>>>>>            ud = fetcher.ud[url]
>>>>>>>> -        if ud.type == 'git' or ud.type == 'gitsm':
>>>>>>>> -            name = ud.parm.get('name')
>>>>>>>> -            destsuffix = ud.parm.get('destsuffix')
>>>>>>>> -            if name is not None and destsuffix is not None:
>>>>>>>> -                if ud.user:
>>>>>>>> -                    repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
>>>>>>>> -                else:
>>>>>>>> -                    repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
>>>>>>>> -                path = '%s = { path = "%s" }' % (name, os.path.join(workdir, destsuffix))
>>>>>>>> -                patches.setdefault(repo, []).append(path)
>>>>>>>> +        if ud.type != 'git' and ud.type != 'gitsm':
>>>>>>>> +            continue
>>>>>>>>    
>>>>>>>> -    with open(cargo_config, "a+") as config:
>>>>>>>> -        for k, v in patches.items():
>>>>>>>> -            print('\n[patch."%s"]' % k, file=config)
>>>>>>>> -            for name in v:
>>>>>>>> -                print(name, file=config)
>>>>>>>> +        destsuffix = ud.parm.get('destsuffix')
>>>>>>>> +        crate_folder = os.path.join(workdir, destsuffix)
>>>>>>>>    
>>>>>>>> -    if not patches:
>>>>>>>> -        return
>>>>>>>> +        if destsuffix is None or not is_rust_crate_folder(crate_folder):
>>>>>>>> +            continue
>>>>>>>>    
>>>>>>>> -    # Cargo.lock file is needed for to be sure that artifacts
>>>>>>>> -    # downloaded by the fetch steps are those expected by the
>>>>>>>> -    # project and that the possible patches are correctly applied.
>>>>>>>> -    # Moreover since we do not want any modification
>>>>>>>> -    # of this file (for reproducibility purpose), we prevent it by
>>>>>>>> -    # using --frozen flag (in CARGO_BUILD_FLAGS) and raise a clear error
>>>>>>>> -    # here is better than letting cargo tell (in case the file is missing)
>>>>>>>> -    # "Cargo.lock should be modified but --frozen was given"
>>>>>>>> +        if ud.user:
>>>>>>>> +            repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
>>>>>>>> +        else:
>>>>>>>> +            repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
>>>>>>>>    
>>>>>>>> -    lockfile = d.getVar("CARGO_LOCK_PATH")
>>>>>>>> -    if not os.path.exists(lockfile):
>>>>>>>> -        bb.fatal(f"{lockfile} file doesn't exist")
>>>>>>>> +        sources[destsuffix] = (repo, ud.revision, crate_folder)
>>>>>>>> +
>>>>>>>> +        cargo_toml_path = os.path.join(workdir, destsuffix, 'Cargo.toml')
>>>>>>>> +        cargo_toml = load_toml_file(cargo_toml_path)
>>>>>>>> +
>>>>>>>> +        if 'workspace' in cargo_toml:
>>>>>>>> +            members = cargo_toml['workspace']['members']
>>>>>>>> +            for member in members:
>>>>>>>> +                member_crate_folder = os.path.join(workdir, destsuffix, member)
>>>>>>>> +                member_crate_cargo_toml = os.path.join(member_crate_folder, 'Cargo.toml')
>>>>>>>> +                member_cargo_toml = load_toml_file(member_crate_cargo_toml)
>>>>>>>> +                member_crate_name = member_cargo_toml['package']['name']
>>>>>>>> +                shutil.copytree(member_crate_folder, os.path.join(vendor_folder, member_crate_name))
>>>>>>>> +
>>>>>>>> +        if 'package' in cargo_toml:
>>>>>>>> +            crate_folder = os.path.join(workdir, destsuffix)
>>>>>>>> +            crate_name = cargo_toml['package']['name']
>>>>>>>> +            shutil.copytree(crate_folder, os.path.join(vendor_folder, crate_name))
>>>>>>>> +
>>>>>>>> +    for d in os.scandir(vendor_folder):
>>>>>>>> +        if d.is_dir():
>>>>>>>> +            create_cargo_checksum(d.path)
>>>>>>>> +
>>>>>>>> +
>>>>>>>> +    with open(cargo_config, "a+") as config:
>>>>>>>> +        print('\n[source."yocto-vendored-sources"]', file=config)
>>>>>>>> +        print('directory = "%s"' % vendor_folder, file=config)
>>>>>>>> +
>>>>>>>> +        for destsuffix, (repo, revision, repo_path) in sources.items():
>>>>>>>> +            lockfile_repo = get_matching_repo_from_lockfile(lockfile_git_repos, repo, revision)
>>>>>>>> +            print('\n[source."%s"]' % lockfile_repo, file=config)
>>>>>>>> +            print('git = "%s"' % repo, file=config)
>>>>>>>> +            print('rev = "%s"' % revision, file=config)
>>>>>>>> +            print('replace-with = "yocto-vendored-sources"', file=config)
>>>>>>>> +
>>>>>>>> +    # check if there are any git repos in the lock file that were not visited
>>>>>>>> +    # in the previous loop, when the source replacement was created, and warn about it
>>>>>>>> +    for lf_repo, found_in_src_uri in lockfile_git_repos.items():
>>>>>>>> +        if not found_in_src_uri:
>>>>>>>> +            bb.warn(f"{lf_repo} is present in lockfile, but not found in SRC_URI")
>>>>>>>>    
>>>>>>>> -    # There are patched files and so Cargo.lock should be modified but we use
>>>>>>>> -    # --frozen so let's handle that modifications here.
>>>>>>>> -    #
>>>>>>>> -    # Note that a "better" (more elegant ?) would have been to use cargo update for
>>>>>>>> -    # patched packages:
>>>>>>>> -    #  cargo update --offline -p package_1 -p package_2
>>>>>>>> -    # But this is not possible since it requires that cargo local git db
>>>>>>>> -    # to be populated and this is not the case as we fetch git repo ourself.
>>>>>>>> -
>>>>>>>> -    lockfile_orig = lockfile + ".orig"
>>>>>>>> -    if not os.path.exists(lockfile_orig):
>>>>>>>> -        shutil.copy(lockfile, lockfile_orig)
>>>>>>>> -
>>>>>>>> -    newlines = []
>>>>>>>> -    with open(lockfile_orig, "r") as f:
>>>>>>>> -        for line in f.readlines():
>>>>>>>> -            if not line.startswith("source = \"git"):
>>>>>>>> -                newlines.append(line)
>>>>>>>> -
>>>>>>>> -    with open(lockfile, "w") as f:
>>>>>>>> -        f.writelines(newlines)
>>>>>>>>    }
>>>>>>>> +
>>>>>>>>    do_configure[postfuncs] += "cargo_common_do_patch_paths"
>>>>>>>>    
>>>>>>>>    do_compile:prepend () {
>>>>>>>>
>>>>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>>>>> Links: You receive all messages sent to this group.
>>>>>>>> View/Reply Online (#224426): https://lists.openembedded.org/g/openembedded-core/message/224426
>>>>>>>> Mute This Topic: https://lists.openembedded.org/mt/115578466/6374899
>>>>>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>>>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [stefan.herbrechtsmeier-oss@weidmueller.com]
>>>>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>>>>>


