Return-Path: <freesilicon@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 92F6377A8A;
	Fri, 21 Apr 2017 10:49:37 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id y63so38431090qkd.1;
	Fri, 21 Apr 2017 03:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=3u0U5Piy+ZEI/El7KOyGSrMrZHE5jwf9mCYsimzSMNs=;
	b=K5g+YAlmkm5A9LDIfZVRPZ2Z/ygBHk133nPvssN0nP/njtxLtSz5GzbYZAZpto+BAf
	VLbRbm7Ye2spk8MZmqCaBwTUw8cGeC3YQg8G5gXWY1ng8Mmv/IgQK1Bb42fIbmktkDfv
	hoekBaSbbX+ZoPZaxWlvbfnC4A3+AI5JJrzcqkNbnVLRzzP8nJSBrdUO9VHnUvPrUXDs
	8MTae+tAjkUKWpkwoQ20d+j5stz7kCYVATXobp9744zQD4HA73KDLyK9Nkt79VoAigzh
	HH6Z3VW16QnsfLYLKyj/qqHo8017QOZbtaS6zvPwrSzEjslfA5KayeAf4/5w6FKwWsUs
	gyTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=3u0U5Piy+ZEI/El7KOyGSrMrZHE5jwf9mCYsimzSMNs=;
	b=c/ifP3bAD52zyFoes2ijBA/p+QhPaGluSW+ZaNDewmQrbMur5jZfqnKZ5T5hJHngfE
	84CRVlOq1Ap54GfUgYnKd8S1HJRIxvWcBrmDQG98em8uR/Df3TcBrR5zFISIIPxNxj0H
	6BehRigtOJhJo/v93Y86J85DWW3bd2xbWR6eput8YwwAtVPr9HcQiEwH9R+3dUCWwHvu
	jZhwq+aPnHJfoZ7MQHmSTmKPgMyEw8b8arz2UNTwsoIAJuixcbN0DKfqicoqskO3yo2v
	PUybFo93rTgM42UyYq/6T5y7ULYGDxkKaMkO3JUmfwkivCExnMi9FudDoyJmscjUNacD
	i/QA==
X-Gm-Message-State: AN3rC/4Csst2Pz5X/DpmJmNe5V9MMfO1okZJLCa1iC5q1wIZuDtJVXMe
	yCJgPBUHQCMEdA/T3U6Hf3LsEmxy6pDL
X-Received: by 10.55.12.14 with SMTP id 14mr12090919qkm.249.1492771779198;
	Fri, 21 Apr 2017 03:49:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.152.220 with HTTP; Fri, 21 Apr 2017 03:49:38 -0700 (PDT)
From: David Vincent <freesilicon@gmail.com>
Date: Fri, 21 Apr 2017 12:49:38 +0200
Message-ID: <CAKRNOGxS5k4DSs3LwEDiUNJEcFAAX1LQeN6EUHuppB7Ak7rFEw@mail.gmail.com>
To: openembedded-architecture@lists.openembedded.org
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: [RFC] Handling configuration files
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
X-List-Received-Date: Fri, 21 Apr 2017 10:49:39 -0000
Content-Type: text/plain; charset=UTF-8

Following this thread on OE-Core
(http://lists.openembedded.org/pipermail/openembedded-core/2017-April/135812.html),
the subject of handling configuration files for a machine just got
back. It seems there already was a discussion around it but I couldn't
find it. I know that 2.3 has now hit 'feature-freeze' status but I try
to gather some ideas for maybe an implementation in 2.4.

Simply put, the problem is this:
I want to
  - Override a configuration file in a package
  - Make the configuration machine-specific
  - Upgrade the configuration during package upgrade without human interaction

For now, one way to do this is to append the recipe and to replace the
PACKAGE_ARCH with MACHINE_ARCH. The downside of this approach is that
a package is created for each machine on package repositories where
only the configuration is modified.

Another way is to modify the file in ROOTFS_POSTPROCESS_COMMAND. The
downside is that depending on the packager, it would either not
survive the package upgrade or not be upgradable.

The last way would be to use update-alternatives, but IMHO it does
feel weird. Another downside would be the need to modify all recipes
to mark the configurations as alternatives.

My idea was the following. Maybe we could rely on the CONFFILES
variable to create a -conf package (like -dbg/-dev/-staticdev). If
possible, this package only should be marked as MACHINE_ARCH. This
could happen behind the scenes in package.bbclass. The only problem I
see for now is how to identify that the configuration file has been
overridden in a machine-specific recipe (SRC_URI or other variable ?).
Do you think it is feasible or am I missing something ? I could
proceed to implement that kind of behavior but I would like to know
beforehand if there are other things I should take into account.

Thanks,
David

