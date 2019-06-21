Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9BFD77E695
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 16:58:47 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id x17so7245930wrl.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 09:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=By249qPDUdSGLV0jqtBZlwMTSjRxwb2gWqeEc7dF/p0=;
	b=WssJp0WTGCkVqP2aWRa+p+xvm7BRRzFCgGyGWFJWrcYCo5woNyg5n3uOrtho0Pw5zK
	CY2z6b1AAmI7D0jSBB7dZl8IYYVg48rh7cc8FIWWSk38FD723/PX1bymy2OWNJ8WlOTG
	Q0tlg4txJTnmcZyrEfN91BDcIJ85ebcvn9dgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=By249qPDUdSGLV0jqtBZlwMTSjRxwb2gWqeEc7dF/p0=;
	b=nm3mRex3BA6lRXvqCPAyh04Y7ul4E2Sx1BWWegOK8LILSSNwsNdZWwCwTRPxBt+E8f
	Db5mOWTcLUvX/t4gxUOyz8H2xY5I3Y5Hx2IEBSPcXKRjOqcer2CAM33QsGMO/KqP/AK5
	nW9XysfKs79kgt3lmFS8jUdMVwyjgf8iBq59vg6LAPH9OhZ09Rf7rI6dB8fBz0kRr/gb
	LiP8k7/uJZ6dYuLZgopWSOXnCgyT/6IiS+jVceIJYxQikyrL/Z8rReBj1xCw23bDTLWj
	XqLg/iPbK/uL++FZVFXgZ28uVs0CiAp23XR68/4evvM9flbJwzTJ8UJ+gF/utL3XecAr
	ux/Q==
X-Gm-Message-State: APjAAAV7hD3semNaeOx/nVLEzCZ7DzHb95Vi4zA39XjHP1NV72uf63pR
	ORi84BWqV10FGvk4vwAsaM0pUg==
X-Google-Smtp-Source: APXvYqwvyJ8CQQXZ+E9Gil8thiLhUzxSnN2PeungIWHaVHoe3OcyIZ7CvuNn0kyurhMcxCw+Tmab5w==
X-Received: by 2002:a5d:4949:: with SMTP id r9mr37393435wrs.289.1561136328339; 
	Fri, 21 Jun 2019 09:58:48 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id t63sm3552252wmt.6.2019.06.21.09.58.47
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 21 Jun 2019 09:58:47 -0700 (PDT)
Message-ID: <1a9c38dca2be655c935d435a6cf6f52ae8342bf6.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Jon Mason <jdmason@kudzu.us>
Date: Fri, 21 Jun 2019 17:58:46 +0100
In-Reply-To: <CAPoiz9zekGpeDRd=PMCneuzNeBgEBzHjgoKvcrR5WjnWHUDSiw@mail.gmail.com>
References: <20190621154213.12761-1-jdmason@kudzu.us>
	<eea8e0445b82a8fd472fa9333a665555a990728a.camel@linuxfoundation.org>
	<CAPoiz9zekGpeDRd=PMCneuzNeBgEBzHjgoKvcrR5WjnWHUDSiw@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oe_syslog.py: Handle syslogd/klogd restart race
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
X-List-Received-Date: Fri, 21 Jun 2019 16:58:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-06-21 at 12:39 -0400, Jon Mason wrote:
> On Fri, Jun 21, 2019 at 12:14 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2019-06-21 at 11:42 -0400, Jon Mason wrote:
> > > 
> > Thanks, I think this is reasonable however I think we may need to
> > make
> > the above a function and then call it from other places in the
> > tests in
> > that file.
> > 
> > test_syslog_restart should check it did restart using the above
> > 
> > test_syslog_startup_config does a second restart which we should
> > also
> > check?
> 
> Seems reasonable.  I'll crank out v2 shortly.
> 
> > Out of interest were you able to see error codes being returned in
> > status in your tests?
> 
> I used code to force every error path during development, but not
> that
> the testcase will fail.  So, your question did cause me to notice a
> bug in the code when verifying that the old ones are no longer
> running.  That should return 0 if still running, which wouldn't cause
> the assert outside of the loop.  So, I'll need to tweak this there.
> v2 will have this fix as well.

The reason I ask is that its far from clear that busybox's starts-stop-
daemon would notice if the daemon didn't restart so I don't think we
can reliably trust status to be set correctly.

Is there any reason we can't run these checks regardless of status?

I realise there is slightly more overhead but it might give us more
chance of fixing all the races?

Cheers,

Richard


