Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f169.google.com (mail-ot0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7A4AF60125
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 13:21:48 +0000 (UTC)
Received: by mail-ot0-f169.google.com with SMTP id m11-v6so16880359otf.3
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 06:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=s2ZN5srjEfpPc0W789MLtlRMozhBVGKfB/SJXCUAeQc=;
	b=Teeska4vz8jG1SXDvvzFbss/JhC0jy4VOwzxE2iOryFUnJ8qDvH38lksNzydG+Z0bM
	XEeQvjM9x1D0RnflVUWR4ZZXoSXRpTaPwBcwpv5Yk9WcDPFL8wOjti+I6VL/eW1myYsB
	Rv5+FobdY8bpwFRfOWTeC0cGLHRdnjJNaAddMR3ixYKK1lTcigQ0noBL49sk4zUPkVwo
	DevLaSUWxWP+YeVwhE/J54IeRz+Gq8WjZobEFSgJ6makiS+PQhXqy+I7keO0VD+/SvgI
	sisv96WCo6UeXFqZzXGQTpZfPs8IQu/Ao+Y0NTdc6LK3nOeH2xjkT0JPygDxNgTcPRB6
	QL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=s2ZN5srjEfpPc0W789MLtlRMozhBVGKfB/SJXCUAeQc=;
	b=uW/KbdWhBC9haWDjrX6/QM5lpmqaTOXoznLa5DOevYUoIcKNktWdzNPR7Ng9uxasNE
	otpxXk9bzraH42DnYmh7145hg9uE66l4eCFcRV5J0Mr5RN7Gb176ckQdOBVGZtEV7qKs
	aMqgPXnrCfThGg6ICovpk+s6Q1MVP57Qr92xl5DrULIKhlb7mz60fN+7B53G5RJaYjxh
	82CrpmMw+egrKQNyRunD9fH/MWAEHvMKgCbEQuTtlMBh98wlSdYdV/tKJifxCBTnJeOL
	dAHJRi7K9BhqVvAbqsRckKqcjRAVgUzXhjVEUVbBFb004u5dhc1NCnZcOD8lnvxOnYPE
	aHgQ==
X-Gm-Message-State: ALKqPwfvWzGXOguuZfitFTwG5FikZ6C/I9LQ7PLCknkUbVAPj14t1if1
	uNkhasky5XWSfTzQ5WtWuzt65khustOxGylmPp/U8g==
X-Google-Smtp-Source: ADUXVKIqEmju/fmF5F1P0Ap9phTrVPNEpU7gS8j1xFtGnK7CfLA8uo+pep0duTIf/sCSknzwSL1chEhbjHhZEK14AIo=
X-Received: by 2002:a9d:3023:: with SMTP id
	d32-v6mr10332103otc.23.1527600110128; 
	Tue, 29 May 2018 06:21:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Tue, 29 May 2018 06:21:49
	-0700 (PDT)
In-Reply-To: <D3AF589C68C3694A8188BC776DB93B48A2F26F15@BPXM17GP.gisp.nec.co.jp>
References: <D3AF589C68C3694A8188BC776DB93B48A2F26982@BPXM17GP.gisp.nec.co.jp>
	<c23b345f-564c-6fc8-c1be-7476d7853719@linux.intel.com>
	<D3AF589C68C3694A8188BC776DB93B48A2F26F15@BPXM17GP.gisp.nec.co.jp>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 29 May 2018 16:21:49 +0300
Message-ID: <CANNYZj8TVZkvsAcvRhR-FkyZgrad5ubCAvoE0+duAYF7bnEO+Q@mail.gmail.com>
To: Seiichi Ishitsuka <ishitsuka.sc@ncos.nec.co.jp>
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] telnetd:Fix deadlock on cleanup
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
X-List-Received-Date: Tue, 29 May 2018 13:21:49 -0000
Content-Type: text/plain; charset="UTF-8"

2018-05-29 8:44 GMT+03:00 Seiichi Ishitsuka <ishitsuka.sc@ncos.nec.co.jp>:
> Dear Alex,
>
>> The patch should go to meta-openembedded list, and it should be created against the layer source tree, not against the component source
>> tree.
>
> Thank you for all your kindness.
> I have created a patch for meta-networking/recipes-netkit/netkit-telnet.
> Please refer to the attached patch.

I must clarify: the patch should be sent to the openembedded-devel
mailing list, not to openembedded-core list. Only patches for the
oe-core layer should be sent here; patches for the meta-oe layers go
to oe-devel list.

Also, please use 'git send-email' for sending patches.

Thank you,
Alex

