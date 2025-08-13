Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C12C87FCF
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 09:29:10 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.96678.1755077345486390092
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 02:29:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S7Xv7wtQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-7074710a809so55456446d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 02:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755077344; x=1755682144; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VRkP3i/7JLMSkLiQQt2c87F0gKo035nqHac1DtD6mc0=;
        b=S7Xv7wtQFRYolaZ1R49o97pcNLD3iKYYbAETu+sDfQ5m+osXJkN24a9D0KCMHzJzf8
         ZFr4FKHcoGuXMBWyKXCLq8eV58OTDqfzb+cd159CarG0jT8uRp5yI6Z0bJsLuFK6CJMo
         wAxXRwuoQn+rVRoOQoGBNpCBJVfRkDRPVIWQbn1SS41ZDySPyrenrmigInYO2MIgLqQv
         zmSSVHbaVAaWtvQrL1RRuGn7bNuwxCN/F88spjgbOFX4WMzqsjljqHgNMCku4iUBTZKf
         CVlaS3sO3WQEoSu2u7sPup5QZ6IKeeHZSf1QLSuVOiUCRCtzDysDyKqbJaTfUq3hauqM
         Etdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755077344; x=1755682144;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VRkP3i/7JLMSkLiQQt2c87F0gKo035nqHac1DtD6mc0=;
        b=cugYZ/WVNxrxFdu3ZbkReo4jEY8HrhyDWI+tZsPNi/oL4/2kVkdgLSwFNKwKEFE39P
         dCZUqvKywCM1X+i8sstqxTVGZfjOdmjXkiv5TrXgdG61eMGR7bdjwHGmS670tMT0yP3r
         mH1qX2O4wLzGf6MbtdPAAuJQwhrIelDRO06DhJQwpIvfnFwdLas79AHjPBwgLDuI6ad+
         /VFMMDKqXE6dgu+1QiD+qq+fkq1vQUgt7M4ptCc+6bLGg/PAY6Ru4ZtPmjkQrzLw1LGq
         WDrPg0duoJrmA9bHf0fwxSh1zHHYtS9ImEDyDWBTZu+E4tNe/ugKMVT2ot/sMRkChYP6
         i27g==
X-Gm-Message-State: AOJu0YzREO9whSJgUD5lmPDG8h5pZ5Wt1izftRF2aUDu3j4C5/1j0pf+
	apu9H/1kknb1azh5XGXWKjisXJGGweHoqV8auDbvYG33hu1q4yQqwmw6pI8jRduAOMqviZK8m9n
	r3tSRWQqrYI3R7eNE7aZVQu3K4KY0A6g=
X-Gm-Gg: ASbGncv9/zuSjAz1Sg7Kagg+Aob37CaVjUsXmaxrCXNGV5/gXNDraayZn5oBubxsn6m
	acw0tEv0bznVkKOpPYUJQGvdk5THZElHqRss4bZlBjK+W2kW+81l4ArEoHiFMeUwbwLTGKQoT3Q
	kNgaRQT8sn/j1gOH8EfbhhZThs/MDXmOqhn4iwUHGAtaOzQU2lg8AvlIR4aCNLpSBYmSUMBH7ct
	oLIFAmwXWJKfYh8Q2KYknkJuwQaICXN6grOs1FKwMZnW1T2iUrn
X-Google-Smtp-Source: AGHT+IF4+LEEJ/xhgPJ4hEemMFIB+BmwkQln3XDLFla/yRugd7m3bzScxT12lZUG86vJiJ3UWw32boDLKuvwcoTbq/k=
X-Received: by 2002:ad4:5d41:0:b0:707:56a4:5b56 with SMTP id
 6a1803df08f44-709e8977120mr24626076d6.40.1755077344393; Wed, 13 Aug 2025
 02:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250813092042.247966-1-pistora.tobias@gmail.com> <20250813092042.247966-3-pistora.tobias@gmail.com>
In-Reply-To: <20250813092042.247966-3-pistora.tobias@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 13 Aug 2025 11:28:53 +0200
X-Gm-Features: Ac12FXy7DaQfVrYNwCtxJukqyU_rN60WbG3ocGdarRmgZGHlIOU2l4gYGlgDFkc
Message-ID: <CANNYZj-HurhgpaUi4-MeCmqmJHUWqCFafPntg+Cn_jEhYHvLjA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] selftest/devtool: add devtool upgrade
 selftest for recipes with git submodules
To: pistora.tobias@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 09:29:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221798

Awesome, I like the reuse of existing code (there's a tendency in
selftests to copy-paste-tweak instead).

Alex

On Wed, 13 Aug 2025 at 11:21, Tobias Pistora via
lists.openembedded.org
<pistora.tobias=gmail.com@lists.openembedded.org> wrote:
>
> Tests [YOCTO #15943]
>
> Move code from test_devtool_upgrade_git() into separate, local function.
> Add a test_devtool_upgrade_gitsm() selftest for devtool.
> Add recipes for testing gitsm components.
>
> Signed-off-by: Tobias Pistora <pistora.tobias@gmail.com>
> ---
> changes in v2:
> - this patch was added in v2
>
>  .../devtool/devtool-upgrade-test5_git.bb      | 32 +++++++++++++++++++
>  .../devtool-upgrade-test5_git.bb.upgraded     | 31 ++++++++++++++++++
>  meta/lib/oeqa/selftest/cases/devtool.py       | 10 ++++--
>  3 files changed, 70 insertions(+), 3 deletions(-)
>  create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb
>  create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb.upgraded
>
> diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb
> new file mode 100644
> index 0000000000..7e8b001a28
> --- /dev/null
> +++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb
> @@ -0,0 +1,32 @@
> +SUMMARY = "Test recipe for fetching git submodules"
> +HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/git-submodule-test/"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +INHIBIT_DEFAULT_DEPS = "1"
> +
> +# Note: this is intentionally not the latest version in the original .bb
> +SRCREV = "132fea6e4dee56b61bcf5721c94e8b2445c6a017"
> +PV = "0.1+git"
> +PR = "r2"
> +
> +SRC_URI = "gitsm://git.yoctoproject.org/git-submodule-test;branch=master"
> +UPSTREAM_CHECK_COMMITS = "1"
> +RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
> +
> +EXCLUDE_FROM_WORLD = "1"
> +
> +do_test_git_as_user() {
> +    cd ${S}
> +    git status
> +    git submodule status
> +}
> +addtask test_git_as_user after do_unpack
> +
> +fakeroot do_test_git_as_root() {
> +    cd ${S}
> +    git status
> +    git submodule status
> +}
> +do_test_git_as_root[depends] += "virtual/fakeroot-native:do_populate_sysroot"
> +addtask test_git_as_root after do_unpack
> \ No newline at end of file
> diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb.upgraded b/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb.upgraded
> new file mode 100644
> index 0000000000..938c46b016
> --- /dev/null
> +++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb.upgraded
> @@ -0,0 +1,31 @@
> +SUMMARY = "Test recipe for fetching git submodules"
> +HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/git-submodule-test/"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +INHIBIT_DEFAULT_DEPS = "1"
> +
> +# Note: this is intentionally not the latest version in the original .bb
> +SRCREV = "a2885dd7d25380d23627e7544b7bbb55014b16ee"
> +PV = "0.1+git"
> +
> +SRC_URI = "gitsm://git.yoctoproject.org/git-submodule-test;branch=master"
> +UPSTREAM_CHECK_COMMITS = "1"
> +RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
> +
> +EXCLUDE_FROM_WORLD = "1"
> +
> +do_test_git_as_user() {
> +    cd ${S}
> +    git status
> +    git submodule status
> +}
> +addtask test_git_as_user after do_unpack
> +
> +fakeroot do_test_git_as_root() {
> +    cd ${S}
> +    git status
> +    git submodule status
> +}
> +do_test_git_as_root[depends] += "virtual/fakeroot-native:do_populate_sysroot"
> +addtask test_git_as_root after do_unpack
> \ No newline at end of file
> diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
> index 580c567be3..19a205912b 100644
> --- a/meta/lib/oeqa/selftest/cases/devtool.py
> +++ b/meta/lib/oeqa/selftest/cases/devtool.py
> @@ -1958,13 +1958,11 @@ class DevtoolUpgradeTests(DevtoolBase):
>          self.assertNotIn(recipe, result.output)
>          self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipe), 'Recipe directory should not exist after resetting')
>
> -    def test_devtool_upgrade_git(self):
> +    def _test_devtool_upgrade_git_by_recipe(self, recipe, commit):
>          # Check preconditions
>          self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
>          self.track_for_cleanup(self.workspacedir)
>          self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
> -        recipe = 'devtool-upgrade-test2'
> -        commit = '6cc6077a36fe2648a5f993fe7c16c9632f946517'
>          oldrecipefile = get_bb_var('FILE', recipe)
>          tempdir = tempfile.mkdtemp(prefix='devtoolqa')
>          self.track_for_cleanup(tempdir)
> @@ -1994,6 +1992,12 @@ class DevtoolUpgradeTests(DevtoolBase):
>          self.assertNotIn(recipe, result.output)
>          self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipe), 'Recipe directory should not exist after resetting')
>
> +    def test_devtool_upgrade_git(self):
> +        self._test_devtool_upgrade_git_by_recipe('devtool-upgrade-test2', '6cc6077a36fe2648a5f993fe7c16c9632f946517')
> +
> +    def test_devtool_upgrade_gitsm(self):
> +        self._test_devtool_upgrade_git_by_recipe('devtool-upgrade-test5', 'a2885dd7d25380d23627e7544b7bbb55014b16ee')
> +
>      def test_devtool_upgrade_drop_md5sum(self):
>          # Check preconditions
>          self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
> --
> 2.39.5
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221797): https://lists.openembedded.org/g/openembedded-core/message/221797
> Mute This Topic: https://lists.openembedded.org/mt/114680479/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

