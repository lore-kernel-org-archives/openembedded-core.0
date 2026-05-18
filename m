Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71231CD4F52
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 10:23:27 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5518.1779099803791735940
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 03:23:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OyvmsMZi;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8b9f2295a9dso25642906d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 03:23:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779099803; cv=none;
        d=google.com; s=arc-20240605;
        b=cMqzBiK/FRBiir4yfKfuuhjl7aa2+cV+gJUKUkRmdrwSN9ycdwQT+4ErEohEmwcL4+
         2sAXLcmHRnhpFGIn85cLxJ+TujpkkbQNuA1+9MqinwC2XH1dMaScLfPEEVhj7EJ871Xi
         XATiePQ5Q2ZxOJJZDg1GZNcVgmljIg7HCPgWLUTmApmx32QJdm8cN+4lDvxg8psI6YhO
         sS0gQqcMWAbWnhms8zzmYg5XCeUFf2iblbATfzX6PnU9N6mabTwcRmjbElpTA66gVzsm
         uaq5Oo/sPqYlOZYews0tJucG52lkmc+ZjCy88ytVJnbCikHdHthPWlczYzf2MUBGWx44
         lucg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E32Z4wEVHm+ISMvEzGuzB/h+Sjtuc1UXEh6CGgBKd+E=;
        fh=DBggI1vwST8sHZz5miDAs3Kfl5FaV5CpuZRclKXf2+w=;
        b=iu+8NXzd3/B+lljl34T+EKuOkyAhtzVjTcvTM2nuMVC8kT2Iha9fRAhvoRpR2hnQrw
         RuZAjVrYbkzfs4S8Sej/oG5OfY2wPkXt2KGpjOUxCGgd8VxhzsJoE3ajrdD2psJq5Dty
         dd4bqD8WCwsHxv6MtS+4AShJCdxbt7R0rRGyuut3IEd+UB6ErKFkBMKK7wtnHHN1DMOE
         Oe5o/pQ1rq6aHp0L//tXWmnv64VZZKI5uWCRKzxF4BTfDhUfYPk3N7lglM+k1MU4MRiu
         3nugOqcctXhIfEji5K9sW4VGysyg1SsLUadmIJ3xuHMQ7O3eVJoHpCynCO8pE0tNS776
         EPWQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779099803; x=1779704603; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E32Z4wEVHm+ISMvEzGuzB/h+Sjtuc1UXEh6CGgBKd+E=;
        b=OyvmsMZid+zWtXjeG1Oy/bAJz7rMkESItImD7JMr4YqFrgwUmWPEG6eOVN5N3j/QZU
         B+lVAJcMQ1abEaQTCyIW0Hw1FwgZ+Cmn4kUj7n5FJxswK/CbcQkgAUb61xGenPy++ti9
         yS5e33TIuKZjnXV9CJSgofULORnv632BqJ7CGsrvFqJF5wi8fzH11MnnE1RHuzsm9KAh
         hdn7paBkOvvbzJHoh3dJiR1tgHNh6v6xJBYuJLX5jP28/aCn8zN3TXyPNCqhC/s4bLCO
         t/HYFT+CYNole6ONuszvJBRsICESzKrs5ukjYFUzkapmRUGAFVDlS50nyQBbFMNVBao4
         TSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779099803; x=1779704603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E32Z4wEVHm+ISMvEzGuzB/h+Sjtuc1UXEh6CGgBKd+E=;
        b=aJu0AHeRpOaD1eLD0w021u0UkW5ToPajMAd7IDBNrZgDtDJWgt4RL+TtXqVp3if4WE
         pXfosB5rB3DT6D1b5ADxQKwwParMSjUZ1NfEwHwXtHcCHA04JiXNrYmLHS+clB8qjgGL
         lfIz/RHWN6zK9l7aEsu0Dw61kzS3fnRKTVoj1V++CSU9ZOsGZtMy99aHu7XL0nfyhRPM
         aCpDIH23/s7nrv1f3L22WmBbffCCBroVR6R19xXzLFOmIMy3Ep1dJNT8w+OA7zkBBuw3
         Gtj9d+j6oFSzTFmza+lmhj3NKBLA9q3UyuN+tRdidPNJ52bRpV3JMnvFQRMzvyJPTort
         BFIg==
X-Gm-Message-State: AOJu0YzuHY71b/82nCq/7V4589oGfXCLzrOR4HYQLWd2KQ/SzMKcOQyo
	3CWqPrxYHmBn6u7CXDexR7EeUNz5/jMy2FOnQ+c2uxQW8e4RzY1liArmiZL34hFx7mE28I4QsUk
	7wd1+VQGHkFH/lS7pePzjWLsCnPRT4+Whjg==
X-Gm-Gg: Acq92OESRfagnmoVnjvmhaJK421rlaj8KmJ0GSSho5VuyONFmUSp5PnEBySwInAHAwn
	bwh2QfTaEFS0FF3ujLIjVOy+lMWvxV8t92BCA0DT/dMTs74NlyMKCuWIPxkMTvbJW0u3z+2CI78
	zQP6e6ZSSMlTltEEywvIkeY1ws6SSNQA2kOXBmiFCsncIan1hzXP9IV4VddXJlUYCX02Y0P7ufl
	gIbS02Iyts+i6YZu+6abdjLyT9kYhTxER4To40tf1Tnf/kVQGDZU2OOyOQAeWUnmp9bJTHcZ1if
	//SddWZKJTamgh2sdLczTe7jMzIy3U0J16zyIze6bw==
X-Received: by 2002:a05:6214:54c3:b0:8ac:7d43:f88d with SMTP id
 6a1803df08f44-8ca0f54dfedmr237087666d6.0.1779099802807; Mon, 18 May 2026
 03:23:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260515024119.4192524-1-changqing.li@windriver.com> <1690109.1779090117529753592@lists.openembedded.org>
In-Reply-To: <1690109.1779090117529753592@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 May 2026 12:23:13 +0200
X-Gm-Features: AVHnY4LVQOkKq1WNCTQIFloqVRjmTk57pDwGdk_33RXrUtSieF5xer8n6Diue4k
Message-ID: <CANNYZj_wSRB_S9OzaOOGppiprcuLPj5P3EHrcd2gs=0MgOH4PA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cgo-helloworld: init add
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 10:23:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237212

On Mon, 18 May 2026 at 09:41, Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
> Shouldn=E2=80=99t this recipe reside within the meta-sefltest layer ?

No, because recipes in meta-selftest are not included in reproducibility te=
sts.

Alex

