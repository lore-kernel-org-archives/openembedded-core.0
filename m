Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8908F7CC0F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 17:04:12 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id 98so2475399oty.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 09:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Vcuak52iUGksg3mNkC5jVVlpch9pDS1oH0oddDAxy2U=;
	b=ajjawGns8DbyozFJuxnP3e5eabOd7w++ZBHZOgFk8tsP92hdjsSBoQNobIfB+aT9rN
	u4MhXBt1uLagyIDYWJ1/dKRKzGSpmbnmLGhoRdd3lu7tMZgqTiBSAOWQD3a4KNrha/cs
	PF6E+Yzk03MYOhNIqCVvZtLb88ikWmVITIRcVGI19i8Jc4f9//60l4mKNWpr1+FXgZYC
	Boq8sUw4ziTtRzUblNJuD3A7XWsYOtWMHnqr1skskkwcg874WFQjA2Fx+Qs64q6yxyQn
	/a7Gqh92dg2PzJY9xYSVTuGh9yjz/yvqoKomr3ZnhKspCrs/ej7LBB43eA3HLiuWUrDa
	Qfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Vcuak52iUGksg3mNkC5jVVlpch9pDS1oH0oddDAxy2U=;
	b=kPCF49DHrLrr3wzLo4pu6pPPsE2UruBfc23Cs3v9J1oaUqZRTtCzDeXaldhbgC4Z68
	0tK7kzFWXiblGlEjWabGXhER4n9BDx8+ddZmgsZs40GlZdbneHIiHRZLrKgLMzkmTyfO
	hX9ADpxhSzweqDldSJrHlH1IAy2HSb6JYdobVll0pJznklq1omyfvC7Dqflh2nvMtSy7
	/PHWC3RmW9ikIocVqImOXwnGqu3Ptbx1egoMzuR5ijh0iof4PXOd7KSyDIcImDq4DLI+
	g4Q/rY/GT3xZkJwlGrnSqtL08GUlR/Oo2KLEdCTfYVzXBv8pHEjsskEaCdkwbO3sxIZP
	UYwg==
X-Gm-Message-State: AHQUAuZUOovkQR+yoYTEbabHqjdMtx2HsfP5leZypQd5Ff3wmxYhn9hh
	R7AOEH2AjAcC+Ygd0I5DQuLzdrf4thFkBwsZjDyZIA==
X-Google-Smtp-Source: AHgI3IZmP3BFEcXzQaACR457QEAFOUOgPadgL8MrMbseEkjRfaLp7omNZ+CGW382hfmBVpgqVoEpVH/bpGWMdBFDYB4=
X-Received: by 2002:a9d:d0e:: with SMTP id 14mr3481723oti.360.1550855053438;
	Fri, 22 Feb 2019 09:04:13 -0800 (PST)
MIME-Version: 1.0
References: <20190222165450.30773-1-george.mccollister@gmail.com>
In-Reply-To: <20190222165450.30773-1-george.mccollister@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 22 Feb 2019 18:04:01 +0100
Message-ID: <CANNYZj-Fx7W5MKb8hp9F5mPC05fhxq1S56_F9-PDr38yK1ofVw@mail.gmail.com>
To: George McCollister <george.mccollister@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: fix CVE-2019-6454
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
X-List-Received-Date: Fri, 22 Feb 2019 17:04:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Feb 2019 at 17:55, George McCollister
<george.mccollister@gmail.com> wrote:
> Apply patches from systemd_239-7ubuntu10.8 to fix CVE-2019-6454.
> CVE-2019-6454 is an issue in which systemd (PID1) can be crashed with a
> specially formed D-Bus message.
> +
> +For information see:
> +https://usn.ubuntu.com/3891-1/
> +https://git.launchpad.net/ubuntu/+source/systemd/commit/?id=f8e75d5634904c8e672658856508c3a02f349adb
> +
> +CVE: CVE-2019-6454
> +Upstream-Status: Backport

It would be better to update systemd to latest upstream release, are
you able to do this?

Alex

