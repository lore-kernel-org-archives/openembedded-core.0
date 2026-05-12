Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAFB5CD4F24
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 16:28:44 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.80066.1778603318858274123
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 09:28:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sbgf3MOE;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8cb5c9ba82bso821114985a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 09:28:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778603318; cv=none;
        d=google.com; s=arc-20240605;
        b=letQzAnMVu3a3Lg90w+OnaQimWOnloma6YCmPF909azUTGCuscY6TdCtVIYhZTgrJi
         3BNVbv841SNcETi3D+1+TNRl4U3H9W7KFngvXgQ3g5kLexg8pCGfzpaO+vDjHbwGKEz6
         wvi+CqSYBS99KcIpbIGPbmQ7zGiygKfWKeDTwiXt6eLd2eo5k42a5gxj00VN9I/WZ0T1
         ZaEnvf+YPeMF63ghDgFEUTbXOBwkGh0N4NtkXFrs4lwlSPdycNjN9lMo5Su+v+xzp+4h
         6Ogf/DBABxZfVqWODE2L48yiSOcbfR/qZ49avnvfsBBvmYGtRUmKLMetVGnDTMJnw56O
         liZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zz4aOf3i7F5lIaoShDKpJsUhmqlIjCaFdgSzBdGWCRk=;
        fh=CBzNg/NL21DWTHY4T0WFOKUAyqx0HIPJNzSHf+IjR2E=;
        b=WGOpl70zcS9+AJ9u3r7MjQwo7rnQIRoWcSuAqmrrVxJF+C3s+yZ+smbpVRegkTqTeB
         MFz5QP2aoB0gCer4D6LSTanER5VMA4s0y37e95jLWSR7s7ExokVvhBTchxcHKEDJ3t6L
         R5JYDMdcnCy/zhWdLoFhfY/rZHdDzu8u6XoQQu/T2KGAkBNeHUHUwOyLmc4kizP6XLSA
         8NiFsPwv0FdXElC6uCI1GNovnlWxm3zrOtKz3n5bgXFNl9o2gDRuixvojgpkIt/7BPUc
         Pi1R2OM5t0hekfKvLNnHjXlshUmIqES97kEaE5qWfSKCbTUaNU+bDjWEmGPz83uXNWJd
         rUFw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778603318; x=1779208118; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zz4aOf3i7F5lIaoShDKpJsUhmqlIjCaFdgSzBdGWCRk=;
        b=sbgf3MOEhaYUbyyMjZDsGTGl85kNt8CFKbJV0jkJ8gB2uqZplPKZ2KQ5h1wRHmfg+4
         y1SGmuPAlPv4ySeJ6CPO8IITuBvJ9AICduHcztYoxhxUL4Juwc+Hwe96m3KsEgU66h+t
         FoqvFbHLxykFfkaMA3pEvhQK5C9rmNp8LB4GPaE4ViWxpG4AhPBPMX166Ms0/y6HV8oV
         gIJnhKYDLehmN65+auBKLV8xN0rFvK8K1YF+Sjoz8uWKGsCib0JoACM1NgKXfS5h4GUH
         6wFJ0E/AL3pkElwTKsYyWWIsc3OSldTCYLWlgoylzxTVjdXJrFaVZzMJUnR8IZE8KO2X
         W3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778603318; x=1779208118;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zz4aOf3i7F5lIaoShDKpJsUhmqlIjCaFdgSzBdGWCRk=;
        b=lCgySBuZO+f/b5xq6G6mMkcci2DdnQvqt+fbm3O3ch6z6a378gj1u0VfyBC9Mm09gh
         4KOmZ55EBiDt90AMyfUrzj54Xs1CG2a6ByhnotB+0T0GwKrWsZjfKTniM7Nm1cszRiCF
         ziiwZShF96ZGic+LA3SrZm7PieNIHXyaEzYBip/li0U57pXRjfxKQwArJkm84HLbXovh
         TQb/Q02dP+36hTRQHDNcwhrds2vtvXbiIHO5lU8EawxIKrvsr8SryFJtLQvk1g3pUNmk
         mCGpUUaiJIHNXe+uNxh/yGQYEyHNnh4Utu4+cWiq6lnwc9nJyEEtB9SwXDE168fJqidZ
         8GrA==
X-Gm-Message-State: AOJu0Yxr9jj7XnI+ELi3dVdxAEsoOHVgogZtGUFnTMknEdlZP5oBOq0a
	VywwzAf+Po0GGEiYz+82nIu6oBNqwfoJCvEcVXDoXFJu2hrKr+v2bQmrjRSwjdNrOP1MtTuPJtq
	XdLcPLothReOVqnXlcl6zjU7YtoBr9Gk=
X-Gm-Gg: Acq92OHH8w/QTNUATeYOyjvGQ9VUGcfXIkE7mroUPOTFASx+aEuLqzJmf9O4OJpdTBu
	riuMRIDsmRnOVAMpbSYywXc6MpzKrILp2f/1zCAk/nCA9utNSuI05PDCEqxnONzarAaBYMFSgoN
	ChWIgLXA9umoyLYNpJYOx5X3KUvME3Ii7bl06ZF1tlDP10EETMLFxAg8y5BAJdJcLlwNb0J84FW
	71x5qb08jG6D6SSFMSqJ0ky8XA+ttoZ5nbiPjmM+SP+4PFOqh0Sm+3sjQpgJ1//PgZaaXRLp+bO
	ZnpHJWLRbTAZ5/kn40wKdLuvUcWktdguhZbT76aYbA==
X-Received: by 2002:a05:620a:478a:b0:90d:1c6f:ce0a with SMTP id
 af79cd13be357-90d1c6fcea5mr307899285a.52.1778603317796; Tue, 12 May 2026
 09:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260512072446.2323529-1-daniel.turull@ericsson.com> <20260512072446.2323529-2-daniel.turull@ericsson.com>
In-Reply-To: <20260512072446.2323529-2-daniel.turull@ericsson.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 May 2026 18:28:25 +0200
X-Gm-Features: AVHnY4Jp1OYzybRCfx8ecxewbOkNptl0g7fX8F08JoXwTAEUdepvKC8bwm0i3fI
Message-ID: <CANNYZj92u79B64dhqRv9P0T7mA-bLDNLc9jhPbOgwczGbFSjKw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] devtool: upgrade: extract changelog between versions
To: daniel.turull@ericsson.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 16:28:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236890

On Tue, 12 May 2026 at 09:25, Daniel Turull via lists.openembedded.org
<daniel.turull=ericsson.com@lists.openembedded.org> wrote:
> Automatically extract changelog information when upgrading a recipe.
> Uses the devtool-base tags created during upgrade to diff known
> changelog files (NEWS, ChangeLog, CHANGES, etc.) between the old and
> new versions. For git-based sources, falls back to git log --oneline
> if no changelog file changed.
>
> Output is written to workspace/changelogs/<pn>.txt and cleaned up on
> devtool reset. This allows AUH and other tools to pick up the changelog
> without implementing their own extraction logic.

Thanks, I like this a lot, and I think this should be fairly easy to
get merged. Just a couple notes:

- probably patches 2/3 and 3/3 should all be folded into the main
commit? (but also add those commit messages to the main commit
message, don't discard the additional information)

- please see below this about testing the functionality

> +    def test_devtool_upgrade_changelog(self):
> +        # Check preconditions
> +        self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
> +        self.track_for_cleanup(self.workspacedir)
> +        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
> +        # dbus-wait has ChangeLog/NEWS files and one commit between these revisions
> +        recipe = 'devtool-upgrade-test2'
> +        commit = '6cc6077a36fe2648a5f993fe7c16c9632f946517'
> +        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
> +        self.track_for_cleanup(tempdir)
> +        # Perform upgrade
> +        runCmd('devtool upgrade %s %s -S %s' % (recipe, tempdir, commit))
> +        # Check changelog file was created with expected content
> +        changelog_file = os.path.join(self.workspacedir, 'changelogs', '%s.txt' % recipe)
> +        self.assertExists(changelog_file, 'Changelog file should exist after upgrade')
> +        with open(changelog_file, 'r') as f:
> +            content = f.read()
> +        self.assertIn(recipe, content)
> +        # The commit between versions fixes a typo - verify we got real content
> +        self.assertIn('typo', content)
> +        # Check devtool reset cleans up changelog
> +        runCmd('devtool reset %s -n' % recipe)
> +        self.assertNotExists(changelog_file, 'Changelog file should be removed after reset')

Rather than write a whole new test (which adds to the overall testing
time, copy-pastes code, and repeats the upgrade procedure already
happening in a different test), I think the changelog checks should be
added to existing tests in DevtoolUpgradeTests class. At least these
tests:

- test_devtool_upgrade
- _test_devtool_upgrade_git_by_recipe

but ideally everything where upgrade operation runs and changelogs are
extracted.

Also, don't look for simple strings as a way to check the changelog
sanity. Instead, write a 'reference changelog' into meta-selftest, and
compare that with the extracted changelog in the workspace, similar to
how upgraded recipes are compared with reference data:

        # Check recipe got changed as expected
        with open(oldrecipefile + '.upgraded', 'r') as f:
            desiredlines = f.readlines()
        with open(newrecipefile, 'r') as f:
            newlines = f.readlines()
        self.assertEqual(desiredlines, newlines)

Such a comparison could probably be in a helper function to avoid
repeating code lines.

It's okay if some of the upgrades are unable to extract anything
useful into the changelog, then the reference data should simply stay
empty. If you can cover all of these, would be awesome:

meta-selftest/recipes-devtools/python/python3-guessing-game-crates.inc.upgraded
meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.upgraded
meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.upgraded
meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb.upgraded
meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb.upgraded
meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb.upgraded

Cheers,
Alex

