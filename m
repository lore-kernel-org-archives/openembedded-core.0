Return-Path: <dbaryshkov@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2AA177F8B1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 12:53:33 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id o8so5373451pls.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 04:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=hQyF5MzcmdirLrbvv4w+m++R72aH1eeVhrOxwWSDxKw=;
	b=gU/RyPATDBQW1cwxnDFuIummDTPr8+5GUIFL6wgCAnbzuOwMpMrndEzUxcK6zO2QjB
	nnADl/oYwbUiEbC9lnTDW7D/FuiKLsTM5gbz1jgvSFB02+x3OPEeT/sNWOfnATpqDZDV
	vMOxmRFaYHcWDgimjz2swcP5b2mojbFTMS3b9pY1nNwWf0iCu1cPwIli/ZkYshiTOu9A
	ydjMq4FECSAUYXljGjvW7QqBOW8XwgIYFYudW5z72/vE7VYdPhdhJAgnrvGBy4cgwud0
	O3qTyW7370df1923W9SIipn261WFKfoNurSwZIuK7AZ8g6mnqEhluwuXaiTrb5q1RVB+
	eS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=hQyF5MzcmdirLrbvv4w+m++R72aH1eeVhrOxwWSDxKw=;
	b=ONc6uPaqDe1pmacKcLw2BP7ApRvizShLUSdKJlcgv6CzUXHQvZ54/2msT4KjqokPFx
	kjGkl2+btcSuksQvmT/Z4gCPn687Q8kwx9zi9Wyzr3+4U+glh6Z6HdehXpbRQ+DFrIeF
	ekTxCp2xO6QuNDn1Cj6sGJ7rKcwF1S5FY9SOYxJIMaUcnejU1YptEKT4BoQbvjqjptR0
	30LRFthhwfw0niMPWT5eKd4FwQDjgZAN8aqASTLxV+LwRQIw1uHMaZ01TaGL0+aSG/q4
	4hP2Q1pn2dDP1ZhkzdR1OaOqNDVcqQwk0Kw9VkR++w1dhM4emof1OOFDkxsQeF/AZ8dq
	MBtg==
X-Gm-Message-State: APjAAAUXNw0vvubYAzEV1tUL+lR99PaNhW/FbRlkeFZYXAB3TkgM3+8Q
	ljb0KZi9seILbnxKILbNBpQCWVlASGf5v9wra4sisAXo
X-Google-Smtp-Source: APXvYqyJzcOO8bSD+nEiuI523xyxprbhGa0WPUi2PUk+E0bEg8pWULyXz7gBAoa06vQirYbp7/2+0l3t96UgqQQW27o=
X-Received: by 2002:a17:902:be10:: with SMTP id
	r16mr4061638pls.169.1574859214673; 
	Wed, 27 Nov 2019 04:53:34 -0800 (PST)
MIME-Version: 1.0
References: <20191101143147.26812-1-dbaryshkov@gmail.com>
In-Reply-To: <20191101143147.26812-1-dbaryshkov@gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Wed, 27 Nov 2019 15:53:17 +0300
Message-ID: <CALT56yOJG1cMBfkC6jXa9RHq_dVHVQxRF2yK1zWF6Q4Dc9oaTA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 0/2] fix multilib issues with UEFI bootloaders
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
X-List-Received-Date: Wed, 27 Nov 2019 12:53:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

=D0=BF=D1=82, 1 =D0=BD=D0=BE=D1=8F=D0=B1. 2019 =D0=B3. =D0=B2 17:32, <dbary=
shkov@gmail.com>:
>
> Last UEFI patchset that went in broke building not-native multilib
> images (like lib32-core-image-minimal). Fix this issue by listing
> systemd-boot as non-multilib recipe and by fixing UEFI app naming in
> multilib cases.

We'd like to unbreak such build. Is there anything wrong with these
two patches? No feedback received up to this point.

--=20
With best wishes
Dmitry

