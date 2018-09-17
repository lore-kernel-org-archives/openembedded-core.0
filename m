Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 54D51793EB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 12:07:03 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id h33-v6so12670601edb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 05:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WZot62ws/Puscl/6qoyHsDGV6ghEC8vnSkwRMRyXCTY=;
	b=XZ4ouq8Rx5cqrtSwBJdKoIDBlZjYJ02ycO2qKUqmqgSs7T5HwGS4FEuxaeNoydfU26
	3AlW5alAbgJEJC5dZ94hEyzWqKvFy8mxYxDI8XAgwr7dhHyxXzNs+btULl0WHeDL9woI
	J5sdEW5awOVbAbFCxUhEVFXJWWACV1YupClfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WZot62ws/Puscl/6qoyHsDGV6ghEC8vnSkwRMRyXCTY=;
	b=Ks5T4hCclFajQXRd7lWoQR2Om9R6g2jFCA6ksmTh0OmMr1U7n5cBv+INybsd3NdSM5
	FzvSkZEv8CbKd18Y2tECVKtXMhVmYhDdOcuBE5cMTQA/hOjE6PJh6MAeNChxv/Hr94Nw
	1zcxMlr3+KxXauBsZOGceUNKch8fLRu2qUa6f6IlQbd57Fp2+XOx2RDe8JpKvKoYeOV2
	CZxJ7GlQAYY4d5f3xH03kdl8QwmOdS+psr0kLJiK8KM6si6NI5c3oBUPGDLBCjPIEKgD
	X3zd+hBWhUiA+1lbIZIy77KA0Qbisimd2yIEMIoEhEmoQGe2ddhPupTd4AlfBZaXHt8K
	FR3Q==
X-Gm-Message-State: APzg51DbHnSm8etZdVEXA+T0YqWrmuqCCd+QMcfSiL7ddEj1N6LifQr1
	kJTqgWGlZyLNz5qK+zKSflBciQ==
X-Google-Smtp-Source: ANB0VdYGmm7flQmCl1MAL0FA8vuXlpSlglK/GtEj+f8rHOopc3WgCubt/nfj9Wa9TBBmtXRlHtswYA==
X-Received: by 2002:a50:a267:: with SMTP id
	94-v6mr44306383edl.189.1537186023989; 
	Mon, 17 Sep 2018 05:07:03 -0700 (PDT)
Received: from hex ([89.248.140.16]) by smtp.gmail.com with ESMTPSA id
	w22-v6sm8372323eda.34.2018.09.17.05.07.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 17 Sep 2018 05:07:03 -0700 (PDT)
Message-ID: <cfff7e9bbbc6e53d83b860c2244c3ac616add0cf.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2018 13:06:50 +0100
In-Reply-To: <cover.1536913629.git.hongxu.jia@windriver.com>
References: <cover.1536913629.git.hongxu.jia@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Subject: Re: [PATCH 0/2] package.bbclass: improve auto debug package splitting order
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
X-List-Received-Date: Mon, 17 Sep 2018 12:07:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-09-14 at 16:49 +0800, Hongxu Jia wrote:
> Hi RP,
> 
> Is it necessary to split multiple sub dbg packages or only
> one dbg is allowed? If the former, this fix makes sense.

Only one is recommended and the code only works properly in some cases
for one. I'd like to be in a position where we could have that as the
only thing we supported but its simply not practical in some cases.

The debug package dependency handling probably needs a rethink but that
would be 2.7 development cycle, its too late for 2.6 now.

> I know in oe-core, almost one dbg package per recipe, but
> in oe, 21 recipes have extra sub dbg package and 18 of them
> did not set NOAUTOPACKAGEDEBUG = "1".
> 
> So rather than modify them one by one tediously, how about to
> improve auto debug package splitting order? If ${PN}-dbg exists,
> split the unsplit debug file to ${PN}-dbg, if ${PN}-dbg does not 
> exist, still split them to first dbg package.

I don't really want to encourage multiple -dbg packages per recipe and
I am a little concerned about making changes to the core packaging code
with the release coming up. Fixing the recipes, although tedious may be
safer/better rather than encouraging people to do things which aren't
well supported.

Cheers,

Richard

