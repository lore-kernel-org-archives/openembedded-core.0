Return-Path: <bijak.dawid@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52116CCFA13
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 12:32:07 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13239.1777638720925017212
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 05:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DrOUHKw6;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: bijak.dawid@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d77f6092eso1173042f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 05:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777638719; x=1778243519; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fQMDdZOzY7Chcp0qUd/nLeaaFuTg1icdyJdB9wofvKE=;
        b=DrOUHKw64jjr4SIBtrtspoyMXe41Ra31JjjyU2+APTlZUwBGxhaupOWZgCyEq+4PYw
         h3oi7uHL+sORdP0Nnhw7/rcRmPQQ0N6/33yOQiaDN65OxPFfavK0QEVryk1G9vwP5DQX
         4B8TjW40BKQi6nBt677dUCs9UJ4ZjsmEKh6aGjKURcpFHHN4hAHJI+tPExqF0LBt7qJQ
         RyxTuXz7bsTSdPujUpmS6C+DCnK1y1sAZyxt17OJONFR5VWcwHWVnHpgpqKXX0hmXeCu
         lfl0zT4ExLybr5p6G8kbNJOD3cOygT1wbT9X43YyVL07xjc/OrOqNpromwIUY2hIhaD3
         tlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777638719; x=1778243519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQMDdZOzY7Chcp0qUd/nLeaaFuTg1icdyJdB9wofvKE=;
        b=j38t/6LW0AqhoC7Us0pt0CsQvXIK5vfyHZva3x2BF9N56b6AMFT7l38NWIAU89Rwi3
         F4sIWsA93Q6SWaPCgifV9D7e2ho3KuTO6ltVu1D0VjPbS7MfFiXJc7w8m7sJlWp3jnrW
         uIvMEsXclC0LOeZDZlJGwW9yI2rC2M1YhV0woPaeQ56rGlcd0d18x03ESLGFMJkiCzjP
         yVs5Fb+Taq6w3jYzs9fxNfOEDPuBxfZlbVkjEi7IIdrj3OXAAhFU0UURHser8KivJdK2
         9aKtYOM19k1WH3OQLoWQ1rSZ+Et1ukI+TbFnOvVCRTx51KAbuvpO/ntr4YkXfp3X34wg
         4k6g==
X-Gm-Message-State: AOJu0YwwGRvjrr0XF9WNxm/VWcieErBv1Q4Dwwcg4Kc1TAC5MHe9QXhk
	ApOlS1ebLNqSOB6PH8C3qbpMpgezslj/+v7dQe9XIKHHAhMEyxvMmsEejL/bZTSSDBs=
X-Gm-Gg: AeBDieuuZOrqREgO1aktji/f55kV1j+7E5AqOh3hVDSTcLFiibatEafeU+jjgHdzEe2
	5HktrWERRThsUDKEzjGFbXcGHKY5NIvYivr5RNOgRI2QwYLCrdqOK/kJVL9cdJAApUPdL1ZA7uu
	ami9Iak0yna7j9X2Zz8I8Qr25quYFn7IElhc0vxyaEpucNv3qfk7fi7jlmTw3hcZcg4WLw1UAQc
	s4uZKaMNByU2/SmyNSFv0b5ltOTUP5sRPHoUnjAhMRYNNe1lmkq5WKK+siofjHOO17a3KjRnm4n
	j2G8YOJrfLUIYRPvLRbN26xR5cFfGoGYefPilqH7aDkzQsOkNV96dMmsELdVTSDBgFp0smgCU+7
	zLcs0Dm96iFCy8vaSWDiODmdAIEU9kCcADAYm05MAAl/UZlgIs7iRI8O424xw3XJzu1UF9hcQQE
	yUl1bYdeK8q2ilY0P7K9v3JOCMznRcP0d9lrshbNFHHpzAtp9cY5ADPux/spCWgM23MQ1burcw9
	axA6tGf8GvgNKAviJ6581+PEo3/myTENDXZjzKjE99eTR2RGKZC1cUsnCexr4dDTB+EidRGZg==
X-Received: by 2002:a5d:68c6:0:b0:44a:fa76:5193 with SMTP id ffacd0b85a97d-44afa765260mr2003353f8f.12.1777638718754;
        Fri, 01 May 2026 05:31:58 -0700 (PDT)
Received: from thinkpad.fritz.box ([2a02:8070:d188:380:64c4:4eb6:9167:a4ec])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-44a986aa3a5sm5161703f8f.26.2026.05.01.05.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 05:31:58 -0700 (PDT)
From: Dawid Bijak <bijak.dawid@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	bruce.ashfield@gmail.com
Subject: kernel-metadata: KMETA_EXTERNAL_BSP(S), tree preparation, and scc semantics
Date: Fri,  1 May 2026 14:31:57 +0200
Message-ID: <20260501123157.95088-1-bijak.dawid@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 12:32:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236193

Hi,

I have a few questions about "linux-yocto-style" kernel recipes and the kernel-metadata machinery. 

I've read the advanced kernel-metadata documentation [0], the previous discussion at [1][2], 
and the patch that introduced "KMETA_EXTERNAL_BSP(S)" [3], but few things still aren't clear to me. 

My current understanding of do_kernel_metadata() is:
1. 
    The BSP description '.scc' is located with the (KMACHINE,LINUX_KERNEL_TYPE) tuple via 'spp --find -DKMACHINE=${KMACHINE} -DKTYPE=${LINUX_KERNEL_TYPE}'.
2. 
    In the default flow, that BSP definition is fed to 'scc' only for the config run. The patch run operates on 
    '${sccs} ${patches} $KERNEL_FEATURES_FINAL' from 'SRC_URI' and explicitly omitting '$bsp_definition'. 
    Any 'patch' directives reached from the BSP '.scc' are therefore skipped, on the assumption that those patches are 
    already committed to the kernel branch being checked out (as is the case of the 'linux-yocto' git tree).
3. 
    Setting 'KMETA_EXTERNAL_BSPS = "t"' in the recipe, or 'define KMETA_EXTERNAL_BSP t' inside the BSP '.scc', 
    add '${bsp_definition}' to '${sccs}' for the patch run, so that the BSP-referenced patches do get applied.

Assuming my understanding is correct, I have a couple of questions:

1.
    Neither 'KMETA_EXTERNAL_BSP' / 'KMETA_EXTERNAL_BSPS' variable appears in [0] or in the variable glossary, 
    but both are part of the public contract of 'kernel-yocto.bbclass' to opt out of the "patches are pre-applied" assumption. 
    Are they undocumented on purpose? Or would you accept a small docs patch adding them to the advanced kernel-metadata page or variable glossary? 

2.
    The Kernel Maintenance appendix mentions that 'kgit-scc' in 'yocto-kernel-tools' is what the yocto-team uses to construct the 
    'linux-yocto' git tree from 'yocto-kernel-cache', and that "the steps used to construct the full kernel tree are the same steps that 
    BitBake uses." 
    For a downstream user with a vanilla kernel tree and a kernel-cache that defines a BSP, what's the recommended 
    way to generate the equivalent branched tree (so the default, non-'KMETA_EXTERNAL_BSP' flow works)? 
    Is 'kgit-scc' intended to be invoked directly for this purpose, or is 'KMETA_EXTERNAL_BSP' the expected path? 
    If you could point to a concrete kgit-scc invocation for this case, that would clear it up.

3.
    Section 3.6 of [0] documents the the branch directive as "branch [ref] - creates a new branch relative to the current branch"

    With 'KMETA_EXTERNAL_BSP' set, the 'patch' directives are applied as expected, 
    but the 'branch branchnaem' directive appears to have no effect - patches are applied on the existing branch rather than on a newly created 'branchname'. Am I misreading the intended semantics of 'branch' here?

Thanks, and again I'd be happy to turn whatever clarifications into doc patches.

Best regards,
Dawid

[0] https://docs.yoctoproject.org/kernel-dev/advanced.html
[1] https://lore.kernel.org/all/CA+4=imafR6ncjuC9UOgR3PBPS7MR7H5fo42vn0M9tk7=GSFUoA@mail.gmail.com/
[2] https://lore.kernel.org/all/20191219183759.3122153-1-JPEWhacker@gmail.com/
[3] https://lore.kernel.org/all/20191220152117.49850-1-bruce.ashfield@gmail.com/

