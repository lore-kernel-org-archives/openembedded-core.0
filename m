Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C8FC28B28
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 14:10:05 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.12775.1742306997064898693
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 07:09:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XMJSpRN6;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.178, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e634c42a296so4593441276.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 07:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1742306996; x=1742911796; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfFqsABztaIMKSn0HdJPB62w7iR3y/QIvnIwDpjax18=;
        b=XMJSpRN6qTYaZyN6rLy0MSAk7FeVs3P13VynqiWZZtuRkUTdDCDV6rDNuLnM1aTwUV
         zUxGB4MNexMT3yF/fLhvrzqfZU+EaYZk/IexMwH3PfhyS4bpRWam06NZ7Bym9ycIHSV6
         Pwd8nRVm6ZIm09ieVC5iSuiw4g2rKkZxDNYLgOBdHEc1Haf4zosa8vbIWLi5C7DAOPqs
         T93Nbv3bXa2djcZxemvJtmrCCLmAWY0vuhXt3Rw902EdGBYltVfCbvAGM/2EEZBvk2Dp
         ngbZ7AZRVk9D0TDwWn8gtwjR2ME5sy8WIx21hC2QqgIjbwmPUaus1FhPT2QjoXv3IZrs
         +dQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742306996; x=1742911796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BfFqsABztaIMKSn0HdJPB62w7iR3y/QIvnIwDpjax18=;
        b=o0ycY6Lx4fvS/iyau69hjmKRkeH78PLh8eNapsZtPylyNf3r6rAW0Hk+X1c1+WcYC7
         CHgGuV/9gGv4wM/G6Y1Tbl09d319bRcrZ7F43U5Q8H+Ze//zlwVfBNPNXMGYrTlLz0uF
         e1s3x4PNMyjb3Qy6mjMi12NqoGXYU3CMrjFqRA7Wp0ef4JiXdMXmuFhmj+MYu6ny//pE
         e6tTtmap6a2NHXas5oO4um06OCE99boWIVQAi33IZcHWk+6P86w9Ra8SyFPLcXyGqimM
         h7Tpc6sZpylSh3dBuYUZKaGELyIAEDs7o0B/OH9p/JLWZG//Ks8lCZ3A4LltxMggiHZ/
         rfgw==
X-Gm-Message-State: AOJu0Yx96evN/ZFcBdoOYcxiFJFxzeL/sS8b2RIhVTKoZsWimG4amusQ
	UzysbHZPDwJTS2aPutQccBuk0ooIxGw2CZLXMcP2uJspA5OeZkr/jDafTxgdAIE4IGA0fMcpEgW
	D6gmCYifq6Er8+h4ehqh4dCz9S3E0qjImndcJRg==
X-Gm-Gg: ASbGncuqzrcbHGbTXRkl8Byy1xv+6G2ObXESLzuh68NAeqZh7Xkkfaf7jqR58XKIDLi
	ivy28+NLOyEaNgB4hd4Dj1ViJpmsxstfzWgyV97nibCw1VTBCR76djYr52i3UGWhWIvRkYkgijp
	2HyA7yNG+bu8fQlIdHvu1P5+abC27MY1gLfrxdVSHQfZ4DrZzAKujh1TDS
X-Google-Smtp-Source: AGHT+IE1F7CYakfzlUfUbA+BdmHajj5TIzKi4gvpbZ1u7E2JC5+GkrvssQL9bl3SQaPO3EyQjbD2wYr0nTOFacSoJiY=
X-Received: by 2002:a05:6902:2745:b0:e60:7d3b:1e18 with SMTP id
 3f1490d57ef6-e63f65bed30mr21059218276.40.1742306996162; Tue, 18 Mar 2025
 07:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <CANpL8Ovos0fzR1eWiDiqURHsQe6WYTeHDgw5MpdqRXh9_qf0yw@mail.gmail.com>
In-Reply-To: <CANpL8Ovos0fzR1eWiDiqURHsQe6WYTeHDgw5MpdqRXh9_qf0yw@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 18 Mar 2025 07:09:45 -0700
X-Gm-Features: AQ5f1Jr_zBZzn4S5WKKsWRjTyvqFcBzUX3eXr_ARa_3HQbPYudMRMP7hx7XDqXo
Message-ID: <CAOSpxdaG3YucxG_W2bYofOaHncLvS7HbYYQE7O9FfsAMaNRcMw@mail.gmail.com>
Subject: Re: [BACKPORT] icu: Adjust ICU_DATA_DIR path on big endian targets
To: Makarios Christakis <makchrbiz@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 14:10:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213214

On Tue, Mar 18, 2025 at 6:57=E2=80=AFAM Makarios Christakis <makchrbiz@gmai=
l.com> wrote:
>
> Hello Steve,
>
> I would like to backport this bugfix from master to Styhead and Scarthgap=
.
>
> Bug description:
> https://lists.openembedded.org/g/openembedded-core/topic/patch_icu_adjust=
/111744704
>
> oe-core master ref: 28cdc0110def011e3d690da1d591076385267ef7
>
> Let me know if this is not the proper way to request this.

It is fine in cases like this where I can do a clean cherry-pick from
the master commit.

I've added the bugfix to my test queue for both styhead and scarthgap.

Steve

