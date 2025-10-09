Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E0FCCD184
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 14:03:57 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.1048.1760018635311046662
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 07:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ItSUTs0e;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afcb7322da8so178957966b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 07:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760018634; x=1760623434; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sbohTwMzQ3yo04uVfq0zeGoXmo/7+mrEpP07oZ8PaOs=;
        b=ItSUTs0eL1eaq5DP/CZCBWRwcvANy4ML5PgqSxwV4JbEE6VdcyIKLZtnLojSf87AOH
         B0Mg6fYp8CB0kQDBtymHGUGmEsUqOKr9qHB5DkLGcd2fklTCYe/Q91yB0K3XevKNvEdk
         r54wRaTc92/cFFiMQ3bph17jHhdrGCbpABIW6kn3cd9piRrheCrOT7Pj111ZMnj7ea9r
         t3OYKyg5acR4UAG3XvRv2opdCvx05zpqxZV/2vCUMOU/qZhL1b4WEjrobYow/030/HQm
         njvfhSou1DefAYuxHrBEFNt0YrnqnOT4FzWjyfvk5wr7T2uMCghJ+1flSbJsqigaAy/K
         Y92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760018634; x=1760623434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sbohTwMzQ3yo04uVfq0zeGoXmo/7+mrEpP07oZ8PaOs=;
        b=Y/dAnqoB0o9BklxizEygJd9PjfSVtVjSxMUDULuHRHNHAUE1Jz4e1SfbMkjF3zW2xX
         FdceWGJkGMs4b16MHAJgVRg6M41LaEIeZGvcqSWYOZefoAY8gGKWatD1iaJC2vG1SkMF
         aDGP1wlJUf8KTFMdVxOOCa4/Ru7JsHbgEnjOZJfgKnm4e38cuBKns3M47YzgjWWwYpkt
         Nmo7XHolNrfKp6AfZPNwo9m1ruxL/+bijBAS9Jx/xagBi5WDGs3Tn2dArPxaom7ZgcgS
         /8L9XYYUKjo2kxPrt2kgfimKKlMpzXAfASXGSf6GkBb3O5nwO5wp3GrBVElfhFNFNfiJ
         6Idg==
X-Forwarded-Encrypted: i=1; AJvYcCWdxdAXJZtyqhXvM8zR9YHeaGpCgk8Lwc1XQeuDYe5oatPtXDCjcvyeR88i2ZMSFrsJb7pZQyTuQzngrPt7yL7/mQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzTpp6v1AlYK7Hs1nJj+a1QXjLQA+Ah+oSzGlNp4orxSvwgM1DI
	NC3anXpsfCetlOofK9QI0bKXNYTnxkno+FFjrEgozt8d4OESVIYJvOa+00uDrQ==
X-Gm-Gg: ASbGncsfdfa4jxU2OqoGzarA/KRGrKzITTOrlPeIgUWNKEBXSstVll0qrqlx1ylgQdt
	RoMl6qrpgZGnutBjG/mWZA3+TlrVCLNZSzgRjBHW2a46i8FLbF76RZDFKoZ8p6YbDd6Ctk/fMGk
	/t0DdIcrOEJe4jUaSJkk6GleAQBR74D5CgNPgdQLdJ3GlG+VQAuoNL3NqCpP0X1wgma2TKrLSqN
	RTIISUEhylOTz4qfXDTJa/WdupVFR+0aKVUfDZ9mYQzeQ1t7GTpZL6MmDlIbsJaSC1r14pyBBTj
	tPxHIcxpCvXsxs3Y5DWaEf/533YI4KDVvtwK0My1RXjTiGv8knwgbTa6gP3CbGjLZReHXnNmD/q
	WycGeWVhtXic7Fd8MCBsOwNskf9D+/Oau68sWP5mZOU0iGN6MuLuyrx0=
X-Google-Smtp-Source: AGHT+IH2t79fZUWgMhXpbTLHLiVSyqYF8WAIutxILcqodrR+RKGmmLLcOPpgPLcTf1m6PNLZFpbmRQ==
X-Received: by 2002:a17:907:9621:b0:b4f:3169:3ec3 with SMTP id a640c23a62f3a-b50aa9a25a7mr879844266b.21.1760018633212;
        Thu, 09 Oct 2025 07:03:53 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652a9ea1sm1888644666b.16.2025.10.09.07.03.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 07:03:52 -0700 (PDT)
Message-ID: <e2372976-8e85-4e96-bb99-982c6d7a0c28@gmail.com>
Date: Thu, 9 Oct 2025 16:03:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH] cargo_common.bbclass: use source
 replacement instead of dependency patching
To: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org
References: <20251003213000.2256939-1-skandigraun@gmail.com>
 <469.1760012328302936344@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <469.1760012328302936344@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 14:03:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224613

On 10/9/25 14:18, Yash Shinde via lists.openembedded.org wrote:
> On Sat, Oct 4, 2025 at 03:00 AM, Gyorgy Sarvari wrote:
>
>     Cargo.toml files usually contain a list of dependencies in one of
>     two forms:
>     either a crate name that can be fetched from some registry (like
>     crates.io), or
>     as a source crate, which is most often fetched from a git repository.
>
>     Normally cargo handles fetching the crates from both the registry
>     and from git,
>     however with Yocto this task is taken over by Bitbake.
>
>     After fetching these crates, they are made available to cargo by
>     adding the location
>     to $CARGO_HOME/config.toml. The source crates are of interest
>     here: each git repository
>     that can be found in the SRC_URI is added as one source crate.
>
>     This works most of the time, as long as the repository really
>     contains one crate only.
>
>     However in case the repository is a cargo workspace, it contains
>     multiple crates in
>     different subfolders, and in order to allow cargo to process them,
>     they need to be
>     listed separately. This is not happening with the current
>     implementation of cargo_common.
>
>     This change introduces the following:
>     - instead of patching the dependencies, use source replacement
>     (the primary motivation for
>     this was that maturin seems to ignore source crate patches from
>     config.toml)
>     - the above also allows to keep the original Cargo.lock untouched
>     (the original implementation
>     deleted git repository lines from it)
>     - it adds a new folder, currently
>     ${UNPACKDIR}/yocto-vendored-source-crates. During processing
>     the separate crate folders are copied into this folder, and it is
>     used as the central
>     vendoring folder. This is needed for source replacements: the
>     folder that is used for
>     vendoring needs to contain the crates separately, one crate in one
>     folder. Each folder
>     has the name of the crate that it contains. Workspaces are not
>     included here (unless the
>     given manifest is a workspace AND a package at once)
>     - previuosly the SRC_URI had to contain a "name" and a
>     "destsuffix" parameter to be considered
>     to be a rust crate. The name is not derived from the Cargo.toml
>     file, not from the SRC_URI.
>     Having destsuffix is still mandatory though.
>
>     The change does not handle nested workspaces, only the top level
>     Cargo.toml is processed.
>
> I would like to understand more about this transition.
> Does this patch address any regression or bug? If so, please provide
> more details.

Thanks a lot for the review.
In case the Cargo project declares a dependency that is fetched from a
git repository, and that dependency is a workspace, then the build fails
(this is true for any cargo project with a workspace git dependency).

When cargo_common patches config.toml it assumes that a repository
contains only 1 crate, and that crate's manifest is in the top folder
always.

With workspaces this might not be the case, they can contain unlimited
number of crates in subfolders, each with its own manifest. In that case
after patching config.toml points to the parent folder of the
sub-crates, however for dependency patching each crates from the
workspace should be mentioned in the patch separately, otherwise cargo
complains that it can't find a crate manifest, only virtual (workspace)
manifests.

The main goal would be to handle this case.

> As mentioned it is meant of maturin crate to handle the patches.
> Can this be done at the crate level?
>

The core-problem with workspaces is a generic issue. My original
patch[1] was much simpler and just extended the existing dependency
patching by adding each crate separately, however maturin didn't pick it
up for some reason. Could be a skill issue on my end - if so, I wouldn't
argue against having simpler code.

[1]: https://lists.openembedded.org/g/openembedded-core/message/224388

> The python errors can be fixed by replacing tomlib (deprecated from
> python 3.14 ) with tomli.

tomli would be a new external dependency, if I'm not mistaken. I
wouldn't argue for a new requirement for this (though if someone else
would, that would make life easier).

>
> The Cargo.lock seems to missing from sysroot and breaks the build
> after this patch.
> ERROR: libstd-rs-1.90.0-r0 do_configure:
> /home/user/poky/build/tmp/work/x86-64-v3-poky-linux/libstd-rs/1.90.0/sources/rustc-1.90.0-src/library/sysroot/Cargo.lock
> file doesn't exist

Thanks for the report! I missed this, but V2 should address it, which
I'm about to send out.

>
>
>     Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>     Cc: Tom Geelen <t.f.g.geelen@gmail.com>
>
>     ---
>     meta/classes-recipe/cargo_common.bbclass | 158 ++++++++++++++++-------
>     1 file changed, 108 insertions(+), 50 deletions(-)
>
>     diff --git a/meta/classes-recipe/cargo_common.bbclass
>     b/meta/classes-recipe/cargo_common.bbclass
>     index c9eb2d09a5..79c1351298 100644
>     --- a/meta/classes-recipe/cargo_common.bbclass
>     +++ b/meta/classes-recipe/cargo_common.bbclass
>     @@ -129,6 +129,44 @@ cargo_common_do_configure () {
>     python cargo_common_do_patch_paths() {
>     import shutil
>
>     + def is_rust_crate_folder(path):
>     + cargo_toml_path = os.path.join(path, 'Cargo.toml')
>     + return os.path.exists(cargo_toml_path)
>     +
>     + def load_toml_file(toml_path):
>     + import tomllib
>     + with open(toml_path, 'rb') as f:
>     + toml = tomllib.load(f)
>
> Use tomli here.
>
>     + return toml
>     +
>     + def get_matching_repo_from_lockfile(lockfile_repos, repo, revision):
>     + for lf_repo in lockfile_repos.keys():
>     + if repo in lf_repo and lf_repo.endswith(revision):
>     + lockfile_repos[lf_repo] = True
>     + return lf_repo.split("#")[0]
>     + bb.fatal('Cannot find %s (%s) repository from SRC_URI in
>     Cargo.lock file' % (repo, revision))
>     +
>     + def create_cargo_checksum(folder_path):
>     + checksum_path = os.path.join(folder_path, '.cargo-checksum.json')
>     + if os.path.exists(checksum_path):
>     + return
>     +
>     + import hashlib, json
>     +
>     + checksum = {'files': {}}
>     + for root, _, files in os.walk(folder_path):
>     + for f in files:
>     + full_path = os.path.join(root, f)
>     + relative_path = os.path.relpath(full_path, folder_path)
>     + if relative_path.startswith(".git/"):
>     + continue
>     + with open(full_path, 'rb') as f2:
>     + file_sha = hashlib.sha256(f2.read()).hexdigest()
>     + checksum["files"][relative_path] = file_sha
>     +
>     + with open(checksum_path, 'w') as f:
>     + json.dump(checksum, f)
>     +
>     cargo_config = os.path.join(d.getVar("CARGO_HOME"), "config.toml")
>     if not os.path.exists(cargo_config):
>     return
>     @@ -137,66 +175,86 @@ python cargo_common_do_patch_paths() {
>     if len(src_uri) == 0:
>     return
>
>     - patches = dict()
>     + lockfile = d.getVar("CARGO_LOCK_PATH")
>     + if not os.path.exists(lockfile):
>     + bb.fatal(f"{lockfile} file doesn't exist")
>     +
>     + lockfile = load_toml_file(lockfile)
>     +
>     + # key is the repo url, value is a boolean, which is used later
>     + # to indicate if there is a matching repository in SRC_URI also
>     + lockfile_git_repos = {}
>     + for p in lockfile['package']:
>     + if 'source' in p and p['source'].startswith('git+'):
>     + lockfile_git_repos[p['source']] = False
>     +
>     + sources = dict()
>     workdir = d.getVar('UNPACKDIR')
>     fetcher = bb.fetch2.Fetch(src_uri, d)
>     +
>     + vendor_folder = os.path.join(workdir,
>     'yocto-vendored-source-crates')
>     +
>     + os.makedirs(vendor_folder)
>     +
>     for url in fetcher.urls:
>     ud = fetcher.ud[url]
>     - if ud.type == 'git' or ud.type == 'gitsm':
>     - name = ud.parm.get('name')
>     - destsuffix = ud.parm.get('destsuffix')
>     - if name is not None and destsuffix is not None:
>     - if ud.user:
>     - repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
>     - else:
>     - repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
>     - path = '%s = { path = "%s" }' % (name, os.path.join(workdir,
>     destsuffix))
>     - patches.setdefault(repo, []).append(path)
>     + if ud.type != 'git' and ud.type != 'gitsm':
>     + continue
>
>     - with open(cargo_config, "a+") as config:
>     - for k, v in patches.items():
>     - print('\n[patch."%s"]' % k, file=config)
>     - for name in v:
>     - print(name, file=config)
>     + destsuffix = ud.parm.get('destsuffix')
>     + crate_folder = os.path.join(workdir, destsuffix)
>
>     - if not patches:
>     - return
>     + if destsuffix is None or not is_rust_crate_folder(crate_folder):
>     + continue
>
>     - # Cargo.lock file is needed for to be sure that artifacts
>     - # downloaded by the fetch steps are those expected by the
>     - # project and that the possible patches are correctly applied.
>     - # Moreover since we do not want any modification
>     - # of this file (for reproducibility purpose), we prevent it by
>     - # using --frozen flag (in CARGO_BUILD_FLAGS) and raise a clear error
>     - # here is better than letting cargo tell (in case the file is
>     missing)
>     - # "Cargo.lock should be modified but --frozen was given"
>     + if ud.user:
>     + repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
>     + else:
>     + repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
>
>     - lockfile = d.getVar("CARGO_LOCK_PATH")
>     - if not os.path.exists(lockfile):
>     - bb.fatal(f"{lockfile} file doesn't exist")
>     + sources[destsuffix] = (repo, ud.revision, crate_folder)
>     +
>     + cargo_toml_path = os.path.join(workdir, destsuffix, 'Cargo.toml')
>     + cargo_toml = load_toml_file(cargo_toml_path)
>     +
>     + if 'workspace' in cargo_toml:
>     + members = cargo_toml['workspace']['members']
>     + for member in members:
>     + member_crate_folder = os.path.join(workdir, destsuffix, member)
>     + member_crate_cargo_toml = os.path.join(member_crate_folder,
>     'Cargo.toml')
>     + member_cargo_toml = load_toml_file(member_crate_cargo_toml)
>     + member_crate_name = member_cargo_toml['package']['name']
>     + shutil.copytree(member_crate_folder, os.path.join(vendor_folder,
>     member_crate_name))
>     +
>     + if 'package' in cargo_toml:
>     + crate_folder = os.path.join(workdir, destsuffix)
>     + crate_name = cargo_toml['package']['name']
>     + shutil.copytree(crate_folder, os.path.join(vendor_folder,
>     crate_name))
>     +
>     + for d in os.scandir(vendor_folder):
>     + if d.is_dir():
>     + create_cargo_checksum(d.path)
>     +
>     +
>     + with open(cargo_config, "a+") as config:
>     + print('\n[source."yocto-vendored-sources"]', file=config)
>     + print('directory = "%s"' % vendor_folder, file=config)
>     +
>     + for destsuffix, (repo, revision, repo_path) in sources.items():
>     + lockfile_repo =
>     get_matching_repo_from_lockfile(lockfile_git_repos, repo, revision)
>     + print('\n[source."%s"]' % lockfile_repo, file=config)
>     + print('git = "%s"' % repo, file=config)
>     + print('rev = "%s"' % revision, file=config)
>     + print('replace-with = "yocto-vendored-sources"', file=config)
>     +
>     + # check if there are any git repos in the lock file that were
>     not visited
>     + # in the previous loop, when the source replacement was created,
>     and warn about it
>     + for lf_repo, found_in_src_uri in lockfile_git_repos.items():
>     + if not found_in_src_uri:
>     + bb.warn(f"{lf_repo} is present in lockfile, but not found in
>     SRC_URI")
>
>     - # There are patched files and so Cargo.lock should be modified
>     but we use
>     - # --frozen so let's handle that modifications here.
>     - #
>     - # Note that a "better" (more elegant ?) would have been to use
>     cargo update for
>     - # patched packages:
>     - # cargo update --offline -p package_1 -p package_2
>     - # But this is not possible since it requires that cargo local git db
>     - # to be populated and this is not the case as we fetch git repo
>     ourself.
>     -
>     - lockfile_orig = lockfile + ".orig"
>     - if not os.path.exists(lockfile_orig):
>     - shutil.copy(lockfile, lockfile_orig)
>     -
>     - newlines = []
>     - with open(lockfile_orig, "r") as f:
>     - for line in f.readlines():
>     - if not line.startswith("source = \"git"):
>     - newlines.append(line)
>     -
>     - with open(lockfile, "w") as f:
>     - f.writelines(newlines)
>     }
>     +
>     do_configure[postfuncs] += "cargo_common_do_patch_paths"
>
>     do_compile:prepend () {
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224612): https://lists.openembedded.org/g/openembedded-core/message/224612
> Mute This Topic: https://lists.openembedded.org/mt/115578466/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


