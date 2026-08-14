Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B6DCC5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 10:01:35 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9667.1786701690267615142
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 03:01:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hWdY0Kik;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-936623c6dd3so111000585a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 03:01:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786701689; cv=none;
        d=google.com; s=arc-20260327;
        b=qMvcfSkTwAUH7gpIkS3iSAzsQVf0GC2XfO6vnZ3PrLUsctDriZVKD3MhV/7CAYH12N
         0JeWHlZLonowunejNFBI6hGgn5Req6C+M0wjHR/I6LgCP/2eeio1a3hK6cDMvhv/krdE
         w7ey40QQ0zMk+dJgvR3/KCEqNAYBcNhKVKL6e9VGhJ3hDa5JW/Kj0+WcMnF5obo7H1dx
         ybiGHDAqiCxVw/YDPZVo17jaloJ+QwkUdIEm5c+yLp5B+Rwd4HfP8A16eznX1SNhwfkp
         NXLO+vkDU3u4rx/+p0NouJeYH/bFST8RagwqUQtIjRwQ1OR0vrM7VcYfCTM23qWz5Ybp
         BkkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jjfuG/+JAIMq+YdILGWo3ydEqTyT23/vuvsfOT9I+8I=;
        fh=Ru948Ime0O2QXPwmK4rYL/b+8iZYkNuW5TMJedgBtMU=;
        b=lF2d0bfraHvqw6tRoVBSH2Nj+aW/O4IMGDEGGNGcf/9c0HEtsxCbPFhmLFvJUc3g07
         qpUgNuWkwKT8KtuZyTgH2ETydKKUf5UjXz8XRD9UZk6jaVaoBeN2xwF/7TSzdRmvinRu
         lMwQvTBxCY3hmOs+n6GeekGTPCQA3E4V9g2/oIYRI0ucBee64HtuaNy1lyfFggqOWnG3
         Ql2ckhghK4kQ1EHsafgvDGYqbyaZc0ftymU9nfdJjtiAC7fKKKvDdGgXhibAMetQ7yZz
         pX8PDgjw/QWMt6/bcaC65McYgn02Zp6159x6FNVkbVNrrV2zcIVQzdteU+Y82XVPxq6m
         QQxQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786701689; x=1787306489; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jjfuG/+JAIMq+YdILGWo3ydEqTyT23/vuvsfOT9I+8I=;
        b=hWdY0KikqB2HZvaMLY+FJoovkycPcG0lNHBid/N2esgY9FKEiMTrVVWEbEdHNOoudW
         Lar48M08S24bbxGXp/CYuHFKO/H/E8VNE3tuhZuMSAh/HsyAEgk3Qu4znHd+wUC5eWK8
         xGL8cHo9BKdt9Pvkm4O9ycgNjHr13uCJ5vNr2wrvghiA0qIsw9btv4ESZrTFwBoAj8mM
         no2A/I/PLOwkdRbeJdnrzREEpl2TgWdmDiXm9j/tZkPaOwZwBHdGZRRqTKqZINFZRlu5
         9pnM1YLbSRmyNeN8c4MMiCQYLtyt0q8YLIz6wdGTyBj6nRfPN44UX7FQt5+It9XbMF9k
         pUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786701689; x=1787306489;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jjfuG/+JAIMq+YdILGWo3ydEqTyT23/vuvsfOT9I+8I=;
        b=ZcKmbyjj0UoY+BLu8K6l4ITNbu7RDp8AM9j3Ar38J6RDTXLlPp8zLqhmYkJprBls8p
         zZgPUGQfSoQCMg8ary+SLT2hYf7fTD/ZP/5Dsehe7jFD4hSqC+78gpoGZSrwv50D8K8I
         xLcH1kNszFKUo5AwbUOHuspjMxVbZsWr+Zz0L1r60o0twIMeLbY2CF7F4bZlQQebke/v
         9Do93ScctM0B9FBupkmFao00C99FXlSnTKB6/GFwtcpAeso3/Sk5HxrbJYqqU9PD/evQ
         HIUWoJ/jHIGVkiS9F6wBchOqQ5+fM83RaubG02K5EMEqNKAlFSYgD2lWvnxgMYhWUqTo
         D2lw==
X-Gm-Message-State: AOJu0YxJZngFH60/esOhc48rmcx3ZT4ySLaoE/u0gi/UqG/Eli1H5tM1
	rMQLDWZFMGC7QYuv4OvdIWQk1LlB9M78VFaN5lbOyeDEJ5ZfxOJgE+6wFYWaesQ1hjlGOJUBzsr
	7uDEzmwC2fJ6awJ1J23dvtK0QwmGDMAc=
X-Gm-Gg: AR+sD11AVMIDDxTDBujPgBFPeSLeHqqv+zXsXIFOCxqGqtpB9Y5d0Z0lnZLuO64+Bu0
	SnNSmUpMCXW0PFTm/IIE+bXlU8qNuK9L9mBX2xfvGQRoA91J3Yp26JTmHS4eXuy3Ha1ChdI+/PP
	znMrhPnfjUP/f9SgcthXsafXaN6hsWrBTjeUqyk905I0p0EkbLH/XU6qptVQxWHNsNrCYWLidXg
	iA9mvGKMUG3aYSLGRdAy+WXoB4kVlb8bbHbEC4ZtRTHcphmdceLplmMP5QuEmGo7YjNW1ZpUl2h
	nq77F+1vZnbmxJZZ1lTY3QArGmgoGixgIEZaqKKlneDJln4yOVyUc89HnZd2nG2Uaj6p3Yev7BW
	Naj4=
X-Received: by 2002:a05:6214:4187:b0:8f1:77b7:9bdc with SMTP id
 6a1803df08f44-90a90f0ca8bmr47938056d6.1.1786701689191; Fri, 14 Aug 2026
 03:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260812-fix-boost-v2-0-cbcb65f5e186@windriver.com>
 <20260812-fix-boost-v2-2-cbcb65f5e186@windriver.com> <CANNYZj_P9HgDR037FQcABPGMJvjNRMN9XZV1KCeHLjBKcy6VoQ@mail.gmail.com>
 <CAGAhMBy9quOTS6Tg1bgC413UqkXcGG89rJRTHmD-mmH2VDqQhw@mail.gmail.com>
In-Reply-To: <CAGAhMBy9quOTS6Tg1bgC413UqkXcGG89rJRTHmD-mmH2VDqQhw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 14 Aug 2026 12:01:16 +0200
X-Gm-Features: AUfX_myW_AugLwH-U5Is4gaTLuO_oNb9ilmpPibPMTQ4a_6-FXPHoBmjW-yoR78
Message-ID: <CANNYZj8x+RGR-=aJ_xCQhp9_hB4LRm-40z98X-jMuc-XFdS6dQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/3] boost-build-native: Add
 python-numpy-include feature
To: Rob Woolley <rob.woolleywr@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 10:01:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243430

On Fri, 14 Aug 2026 at 02:23, Rob Woolley <rob.woolleywr@gmail.com> wrote:
> Thanks for taking a look at this.  I have submitted the patch here ( https://github.com/bfgroup/b2/pull/611 ) and will revise the Upstream-Status in the next series.
>
> Do you have any technical concerns with the changes?

Thanks. The patch itself is fine.

We're trying to get the amount of Pending patches to zero in oe-core
:) Historically it's been misused to solve the submitter's immediate
problem without taking the trouble of actual upstream submission (or
opening a ticket if the patch is clearly inappropriate).

Alex

