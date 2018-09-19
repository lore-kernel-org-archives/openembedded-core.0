Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id CEC75792B0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 21:38:27 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id j9-v6so7333313otl.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 14:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PpcGau9Xz3pE00/p0wl+emZht+v8m11dHYLmUkE7vXg=;
	b=l0iwRavYkDf2dO9dyGJYROaurPUTLhsNlcAXWq6cegMhgfuzaxxBH8xa3sGE+Gffxb
	Sn6yikXHddoo8CgvbH3c7YDqLjcerqyg/Ai6o2IXYd8BYZ/NAtIciTYd/UjpElz4N4Rc
	JyQv0yjiBhOqG03BSXqaqIAJzieqnC6KzCvtNd3DH4app8lGFiul2IyyLuBGGeKcM4t7
	9mGIJkFGHCo1YSvwbEC4RZk44xVFp2I3H2wJ3PVKQSQ7AbnaDiqXPKlVrHwemqvLAOFK
	Ipd//UC67KvN6JpSwuOC97O1JzQEFgDv1hUixOAaIa2oEvHXpqeSxI1IxVVrf39YkMAj
	FaLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PpcGau9Xz3pE00/p0wl+emZht+v8m11dHYLmUkE7vXg=;
	b=IhQHjKiSvoT7Z4S66mqJ4TpDulW2VFqC5DUNV7iJ2Ee6Md17/QB/VGV8CrH+O0eKrN
	3z+ZCPLFIrNuLdCgl12A0H0oVb1ESWX+O6FHEoc/3tktjdKx+3zfrajoKUPvZ/xeO4Vr
	JRtB2KVGVkZeRIuYaoC27Nn9/ISxLlKq/ThD1BimHmsvYdUWWz4VN5ltNXmMHzdIACm5
	/mtqjW3Co52lRnwLVoBkKo0vGRrwLGHq9hrd4vF945MhXHje2/zETXj51tUitcM/kExp
	IjzCFZfqcrt1Mzlce3ceYQSZuuqupWsnyGocuxsi43+cxqk9U/RmTL0MLwAxeQMhMKEg
	xQtA==
X-Gm-Message-State: APzg51B4JmM9TjgK4rchycT/32m9GI7w6UXZCGWlg9A1Fyt9rdTB6WsL
	xhsOLSn99wvurNK1/gbkLBj/b7SEh1Tv0KojJWw7FT5w
X-Google-Smtp-Source: ANB0VdZvS24fZedq9A5ev9eWy5JmouO54OvPekaMjqyYNF5Kwxc97Nhs+6irDgecSYQZiLS8b+6jceEWrn5DfLdxqJA=
X-Received: by 2002:a9d:2816:: with SMTP id
	m22-v6mr19178456otb.22.1537393108703; 
	Wed, 19 Sep 2018 14:38:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:b48b:0:0:0:0:0 with HTTP; Wed, 19 Sep 2018 14:38:28
	-0700 (PDT)
In-Reply-To: <1537391156-12937-1-git-send-email-peter@berginkonsult.se>
References: <1537391156-12937-1-git-send-email-peter@berginkonsult.se>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Sep 2018 23:38:28 +0200
Message-ID: <CANNYZj8fpsCpk4Vkims2rU4mXXH06jdOErOQGLgr0h4Up7kf0A@mail.gmail.com>
To: Peter Bergin <peter@berginkonsult.se>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: handle virtual memory usage when limit is set
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
X-List-Received-Date: Wed, 19 Sep 2018 21:38:28 -0000
Content-Type: text/plain; charset="UTF-8"

2018-09-19 23:05 GMT+02:00 Peter Bergin <peter@berginkonsult.se>:
> Fix the situation where the task do_package_write_rpm ends up in
> "liblzma: memory allocation failed". This happens if the host
> environment has set a limit on virtual_memory for the user with
> 'ulimit -v' for packages with a lot of binary packages, e.g. glibc-locale.
>
> Upstream-Status: Inappropriate [error introduced by oe-core patch on rpm]

The multi-threading patches have been submitted upstream, so the
correct status here would be "Pending [merge of multithreading patches
to upstream]".

Alex

