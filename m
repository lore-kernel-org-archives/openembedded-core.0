Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
	[209.85.221.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7BFD179CE4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 May 2019 17:17:10 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id g18so711539vki.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2019 10:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=MEOkRHR/kbwJ7PB2i9EWqp13v9hUiOf6m0C8qMnjRDE=;
	b=Q5BDWFxIjwo78ftr58AiHF+JUkXz/7uf438H1wwId3a1EeYU7R+t3QD4KkmCDHSTFg
	W+bEX0Ymrsa1dTfKamGhh9aiQOCg1xb8oc80FIilfSp0hd/hzXc7250Pe5wTAdc4IaQ6
	qFchMimN9dmW/6gnxJI6D7VvZoVY1T3nkt+WQYdAG1q1fh0Zfm+mUkx950vpNmzZqWhu
	gMDo/VQ82fJrvEbslXsizHV3D49fk4Pfsqtq/KvfV9pGwpvUBMKpjqo38BxCX3FDl3p8
	6cpRnlAeTTuyXY3aLxe4N0chj5be0HRsc9TuvNZxUaD36qDmK3iS1OzPqzJUKRZs9zAJ
	a4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=MEOkRHR/kbwJ7PB2i9EWqp13v9hUiOf6m0C8qMnjRDE=;
	b=MjAp9QiGndFCiljSGsAUi0RM/P9zGiXyVCB/pQdm/apOJr1sLV4uDdP+YZoQNg4sve
	fEqtqT2AmXjP66yGJbJ4/mLc4F8g/tJCMmBm49ZZaJBOMmcTHxnolIobeAMYoYeS7xUb
	QH5xQdjO+gdOZ6WnhAYUq1tClr1M24lMVwQvQofm+GtdCr4ZqaXPjzlCn81tPPzGQlfK
	fe5s/GOe+4LQoIrNhBjsRSt5KIBIZEVI5PkXkNWQHc3DTUCUs352nmnRbH+mmkkTB2Nb
	aerBAOmm9AXoAvqAfq9pElvH/4JYAQNZPXLlC2CrKqVS8/w0T4JJeFEWKTgKRIPNnGep
	i6qA==
X-Gm-Message-State: APjAAAXDupMhezGWVtYWitWt9qxGr3rHy1NnoLgbQVjONItpjOmATpO4
	uuMNcrMjT8aJolUHE+qyXwT/H1KMlxaJPEX/zR02yPKk
X-Google-Smtp-Source: APXvYqy4cRy63SChJ2Ud4I8c21CjNyWq+Lcy0qOEFmZGZ2vLYse+g1jr37ITXPP8zUxh4xT/PfuS3418QHTzn9qhodM=
X-Received: by 2002:a1f:4842:: with SMTP id v63mr2634567vka.26.1556817431025; 
	Thu, 02 May 2019 10:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <1555525877-19944-1-git-send-email-alex.kiernan@gmail.com>
In-Reply-To: <1555525877-19944-1-git-send-email-alex.kiernan@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 2 May 2019 18:16:58 +0100
Message-ID: <CAO5Uq5QaE0AOxVpaY6q2=qKveUvb-O8LGt5bkti9vU_9T+cL1w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uboot-sign: Fix build when UBOOT_DTB_BINARY is empty
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
X-List-Received-Date: Thu, 02 May 2019 17:17:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 17, 2019 at 7:31 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> When UBOOT_DTB_BINARY is empty and because the code now changes
> directory into ${B}, the test for the existence becomes `[ -f ]` which
> succeeds and subsequently the install fails.
>
> Reorder the code so it's clear that UBOOT_DTB_BINARY empty is an
> expected configuration and then quote UBOOT_DTB_BINARY everywhere so
> no one trips over this again.
>
> Fixes: bacb59079eb6 ("uboot-sign: add support for different u-boot configurations")
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---

Ping?

-- 
Alex Kiernan

