Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8537C433EF
	for <webhook@archiver.kernel.org>; Sun, 12 Dec 2021 12:12:32 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web09.33354.1639311144872084763
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 04:12:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SWc4vIs/;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id a37so18891339ljq.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 04:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H/lnBcd8bWNfpaa6ZyNwRg3pELQKniNOlpGmVSAWCyU=;
        b=SWc4vIs/8EaPqIj674rx88kbQzHgHngwFJyP+P+o4W+PwnyOKHUuIy7ZQTmkfVHR7z
         5uFbnQreHiQpHGeVKBkK/d2e/KxDwcGa713dIRyP3503KPUbhf1acMyZribRZk+AcMwz
         Re8gE2Vsbf08jApe+2cnHCeav3PQ8MZScnwmrXg4aBvASf/yRvVrBTifcmSC8jKuD/YV
         bA4snJQ9Ae22w52UDudX2R3oLz61hr2VolAAIuKRgo9cIbcxVERpKslnGBvvINQ6WigW
         JeHtLajqzzz47BLtAmrMS/ILftwuy4pd/AtFRqo39psCBOo30F1HtC1+EqUPyc16y3nw
         4rRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H/lnBcd8bWNfpaa6ZyNwRg3pELQKniNOlpGmVSAWCyU=;
        b=WpNVMr553TRMF5zS0rKvLfmYAQgSbnA1nJygDOdTFetlYqF6oJDpNIJ9SlhC0HYXmV
         FTG9DmtRVBq8JxOJJFTwRrIuSkt1Fvpm0Z9V7Gbn5k4kvrpKEcSHPXDSPjrpZdL6utiq
         GfVkYuEFFtMl98u3RJrvza/WR6eu2ELgHZ3aeG0Kur8eqUDZiY6A5TwmCLlRV+hG5VKP
         Vp+gAOOmbmqRVjoXCAGwVATrYyJI2HiYP/aebZ37VAUq9CT2wDbMdunHT+gNOvuGWeHk
         PjblOsjPR7w86RE+bVPEtgkwBThmZwiPYCMvBXIjiSFZML1faTiKXX0JSewvqOv9dgmP
         MQeQ==
X-Gm-Message-State: AOAM530fuTMp77V9N6PMvF7gW0KaCzPzYQKtJY5h/pNgZ7Uh1DE3bmsP
	t6ww61nV5n+9vyPfiys1nTyHsoyeojYZkg==
X-Google-Smtp-Source: 
 ABdhPJwlpEjeUBTdbyq+V+QH4WZlYYYgfEGx81b+TtAZW2TdBqYlXypXBx8W4/kxws6bfTGWo5v4Yw==
X-Received: by 2002:a2e:a48e:: with SMTP id
 h14mr24277622lji.211.1639311142728;
        Sun, 12 Dec 2021 04:12:22 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 q3sm1011596lfr.295.2021.12.12.04.12.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 04:12:22 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH v4 0/2] Improve native/cross reproducibility
Date: Sun, 12 Dec 2021 13:11:54 +0100
Message-Id: <20211212121156.3271203-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Dec 2021 12:12:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159577

This patch series is not intended for merge. I only send it out to
highlight where the problems are and to get some discussion going on how/if
we want to improve the situation.

This is a patch series that tries to improve the reproducibility of the
native/cross binaries when building in different directories. Whether this has
any real benefits I'm still not sure of, but I thought I'd share this final
version of the patch series in case someone comes up with an idea. This has
been tested on a Fedora 35 system which uses gcc 11.2.1 at the time of writing.

The RUNTIME hack is questionable, maybe there is a better way to enforce
a fixed RUNTIME entry size during linking. The build system does not do any
additional rpath manipulation for target binaries, so in those cases this is
not a problem. I did ask for some guidance on the gcc-help mailing list [1] on
how to reserve a specific RPATH size during linking, but it would seem that is
not currently possible.

If in the end we do come up with a solution, then it should be tested on the
autobuilders, since otherwise this is going to degrade overtime. It would then
be important that the build paths are of significantly different lengths.
TMPDIR=/tmp/sysrootA/ and TMPDIR=/tmp/sysrootB/ will *not* uncover all
rpath problems.

Another thing that would be useful is if buildhistory could start monitoring
the depsig.do_populate_sysroot files, since that would highlight changes in
the actual file contents, which is currently not covered by buildhistory.

The end result of this patch series is that I can build python3-native in
two different build paths, and the resuling sysroot-components/x86_64/
directories are identical, except for the 'fixmepath.cmd' files, which are not
included in the hash equiv. comparisons. Even so, there remains a lot of
native builds that are going to need to be fixed in similar ways as the
ones in this patch series.

Changes in v2:
 * Fixed building icedtea7-native/openjdk-8-native by prepending a '/' to the
   rpath padding
 * Squashed all the recipe-fixes together in one commit for now

Changes in v3:
 * Rebase on top of master
 * Instead of adding a padding entry to rpath, set phony rpaths in bitbake.conf
   and add patches for unbreaking python3-native and kernel
 * With the changes above we don't need to remove the build ID, so add it back

Changes in v4:
 * Rebase on top of master
 * Cleanup fixes for openssl/ncurses/perlcross/perl
 * Go back to padding rpath and revert the python3-native/kernel fixes, since
   this feels like the least intrusive change, and from what I understand
   cmake also does a similar type of rpath padding in some situations

Previous versions of the patch series:
v1: https://lists.openembedded.org/g/openembedded-core/message/158867
v2: https://lists.openembedded.org/g/openembedded-core/message/158998
v3: https://lists.openembedded.org/g/openembedded-core/message/159181

[1] https://gcc.gnu.org/pipermail/gcc-help/2021-November/140920.html

Jacob Kroon (2):
  bitbake.conf: Pad rpath in native binaries
  Improve native reproducibility in recipes

 meta/classes/chrpath.bbclass                  |  3 +++
 meta/classes/sstate.bbclass                   |  1 +
 meta/conf/bitbake.conf                        |  3 +++
 ...sysroot-and-debug-prefix-map-from-co.patch | 24 ++++++++++++-------
 .../openssl/openssl_3.0.0.bb                  | 12 ++++++----
 meta/recipes-core/ncurses/ncurses.inc         |  9 +++++--
 .../util-linux/util-linux_2.37.2.bb           |  2 +-
 .../libtool/libtool-native_2.4.6.bb           |  1 +
 meta/recipes-devtools/perl/perl_5.34.0.bb     |  3 +++
 .../pkgconfig/pkgconfig_git.bb                |  1 +
 .../python/python3/determinism.patch          | 17 +++++++++++++
 .../recipes-devtools/python/python3_3.10.1.bb |  8 +++++++
 12 files changed, 68 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/determinism.patch


