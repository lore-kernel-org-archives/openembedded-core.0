Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6FB417C268
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 15:55:39 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id m62so5650896ith.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 07:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sAKQiDgt3ZxsOR7N67kQ3jfsyqx7E4/bek4uhCNiG2g=;
	b=KqmPWp1x+f3hI13qOUDcLt4Gg6AhmqMK7tkw9FPuTNaC439zriuHQ0PhJjQt113was
	bvqrF0T+qhyXCFo7Augaq9UX82I/ngyPI9QFmlqax5DG47RQeNM/hVfpxFaQrDOCqx8g
	mGaaDLPEjpsyjPPLedtT40XbfIFYgSYmAfPeKi8CnPp1cU3vhK4od1mOHKKZsk9B8T8h
	l1/EPgEhehpWTrsjSyXJJE8nqyroNyzetVRkn72lxfapi4jcrov/O40kToyx2P7XX6I8
	/MqCnzwADMMk5OfpmAxu4OgBMjoCe5sUFFFeF09duGoKnIb0cxmJZzUqe9yzMVyiVhGR
	gG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sAKQiDgt3ZxsOR7N67kQ3jfsyqx7E4/bek4uhCNiG2g=;
	b=VvbrrvzOjj93RVCarX4mco/EeuEqeVScJmYymdqEhW3UkkfB3rHQR1xoEUofUeMpe4
	fOJ6NDvIQY87nRL2yhV+YcctpFSZwgqg5KLhzb8snDOShXT85foowTeTOPnVr8y+2U70
	I3TlqjmSs58JlyefEcQSgMlJZvEnFZLYRfjLVUHroNaiHlf3XoVeyTXc9UrHvhTM9ZyT
	RzgOXBdUY1NAuR1jbbaCGgYr6mCbdDlibbIoK+tOJhkUdmTNFZbvZ3eKslimynQTxcuU
	N+gto5lp4nbUDRSYb05Nn/E5K9cNmXKgwk3PJ26KvymyF3CfWC13YJl29Edd/bSPkvHm
	OLyA==
X-Gm-Message-State: AJcUukfxElu7FI2dqBaD6SpV7xKMzkd2XbvTLvqngKaE2NLz0v3E/pC4
	8ICF99B0Xu2w042RnpAkmG8flRjI8Wy3lZXpVPDAXnUT
X-Google-Smtp-Source: ALg8bN4EX39I3Sc3ll6XaADqEA8Xw288w1GJ7bsTqKlU0DH6Azkksb1Oc5XtJn8Ql+Gm55cw7eZl6J0khjKl9AvWm9U=
X-Received: by 2002:a02:1bc5:: with SMTP id 66mr4872844jas.105.1548345340370; 
	Thu, 24 Jan 2019 07:55:40 -0800 (PST)
MIME-Version: 1.0
References: <20190124124341.26815-1-marcusc@axis.com>
In-Reply-To: <20190124124341.26815-1-marcusc@axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Jan 2019 15:55:29 +0000
Message-ID: <CAJTo0LbDy-KnLje4Ng4VqD4ojc4tXyKAMWaoq5Q0FroodxU+FQ@mail.gmail.com>
To: Marcus Cooper <marcus.cooper@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] systemd: Security fix CVE-2018-16864
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
X-List-Received-Date: Thu, 24 Jan 2019 15:55:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Jan 2019 at 12:44, Marcus Cooper <marcus.cooper@axis.com> wrote:
> +++ b/meta/recipes-core/systemd/systemd/0024-journald-do-not-store-the-iovec-entry-for-process-co.patch
> @@ -0,0 +1,204 @@
> +From fe19f5a9d0d8b9977e9507a9b66c3cc66744cd38 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
> +Date: Wed, 5 Dec 2018 18:38:39 +0100
> +Subject: [PATCH] journald: do not store the iovec entry for process
> + commandline on stack
> +
> +This fixes a crash where we would read the commandline, whose length is under
> +control of the sending program, and then crash when trying to create a stack
> +allocation for it.
> +
> +CVE-2018-16864
> +https://bugzilla.redhat.com/show_bug.cgi?id=1653855
> +
> +The message actually doesn't get written to disk, because
> +journal_file_append_entry() returns -E2BIG.
> +
> +Patch backported from systemd master at
> +084eeb865ca63887098e0945fb4e93c852b91b0f.

These patches need a CVE tag (CVE: CVE-2018-16864), and
Upstream-Status tag (Backport), and your Signed-off-by.

Ross

