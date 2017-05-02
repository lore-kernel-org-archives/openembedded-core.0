Return-Path: <dev@codyps.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5D1E771E01
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 May 2017 19:07:53 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id n4so22184704qte.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 May 2017 12:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bmvy+MhLNx16Ydy5wlLLvyyCX4WzR+tv5iIeK/nvYTA=;
	b=eQZpRjSzHB8h1N/eUBEVgq3xsF8CCPgodjZL/LYDsgAGXNeNpMVQUDFjhSZpsiED9w
	TPD6MQzyIzr9FGkWyqQi5sQLLe3uigEKojkaEbjlwUPsn1TpyRawQlzPW3a2Cj6d5zMH
	sRvjjFIuyXckwySY4NrmvWcPn1ovoLNd3DvLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bmvy+MhLNx16Ydy5wlLLvyyCX4WzR+tv5iIeK/nvYTA=;
	b=E3M9eK6foFk4iE+4uKIxxGGyPH0MCM6Yt65MWPCN3cW3qNUDXkLDOK1AyjpMnWPKJg
	nu5hao7FWYvWlD9KQ9MtYDYMO6ER12WuhWzB13tdo8RmU+uQQ2gH1I4D748+Dq1wxFtf
	vO4wjYLrAPhU23BpPKWRUF7LgYXO075ZAQ0Grgl16l2bGjiP+RlfqiIa3EeOqNCp55l0
	JzcW9BTa+h+jQ5WQunZGgM1zNb07UQ+ZINxlS78BaaXD7/eoVRBFrMZByZI6OqOW+tNL
	92lb7ghIE3cYURn8WqHeuV/+bujKLEhWG0JLshaSOXQ0Ag1fCT7PP6FH05T0f3UK3nnF
	nvlg==
X-Gm-Message-State: AN3rC/7E8n9qkjPYpZMWfnggMPe1nGQKz3Nc0rR0kRQcRV34uXqw0cr+
	RMoFRqjTpGbvZjD1G/e6OO9nBxfqTA==
X-Received: by 10.200.51.246 with SMTP id d51mr27534253qtb.119.1493752074422; 
	Tue, 02 May 2017 12:07:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.189.129 with HTTP; Tue, 2 May 2017 12:07:54 -0700 (PDT)
X-Originating-IP: [72.74.84.52]
In-Reply-To: <CAJ86T=U29MAsgHYWo4qUt9C1j5CEDscJgEwttx9z6P+FQXEJqA@mail.gmail.com>
References: <20170501194223.16344-1-dev@codyps.com>
	<CAJ86T=X4VYZTkCmeF1tsoKbXxYGJO-i1VPfVa36K38S1Qf-+zw@mail.gmail.com>
	<CAPoQQ-3T6tJSTzzrpf5pfn7RXzP6FEic-54VFVt+6L=ZF5BD=w@mail.gmail.com>
	<CAJ86T=U29MAsgHYWo4qUt9C1j5CEDscJgEwttx9z6P+FQXEJqA@mail.gmail.com>
From: Cody P Schafer <dev@codyps.com>
Date: Tue, 2 May 2017 15:07:54 -0400
Message-ID: <CAPoQQ-12=StmUO64uVY-0RadSgp=PUS7NkdubFWNJ1ukRcMP5w@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake.bbclass: use `cmake --build` to build & install
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
X-List-Received-Date: Tue, 02 May 2017 19:07:54 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 2, 2017 at 12:49 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Tue, May 2, 2017 at 8:49 AM, Cody P Schafer <dev@codyps.com> wrote:
>>>>  do_compile[progress] = "percent"
>>>>  cmake_do_compile()  {
>>>> -       cd ${B}
>>>
>>> Removing the redundant "cd ${B}" should perhaps be a separate commit?
>>
>> I'm not really seeing that as useful, change right now can be viewed
>> as "moves the ${B} from being in `cd` to being part of the command
>> line for `cmake --build`". Is fairly straight forward because cmake
>> requires a path be specified (where `make` makes it optional).
>
> If ${B} is the default directory for both these tasks then "cd ${B}"
> is redundant and can be removed. If it is not the default directory,
> then removing it will potentially break do_compile_append() and
> do_install_append() functions which rely on running in ${B}. That
> logic doesn't depend on whether or not "cmake --build" takes care of
> changing directory on it's own, so if "cd ${B}" is redundant, then
> removing it should be standalone commit.

    meta/classes/base.bbclass
    307:do_configure[dirs] = "${B}"
    326:do_compile[dirs] = "${B}"

${B} is the default dir for do_compile & do_configure.

Are we concerned about prepend scripts changing the directory to
something not-${B} & appends implicitly relying on ${B} being the
directory?

It seems that prepends/appends should avoid changing directories &/or
avoid depending on a specific directory. Many (but not all) of the
appends I've seen are pretty explicitly about the dirs they need
(Using ${B}, ${S}, and ${WORKDIR} as needed instead of assuming the
dir). Is there a policy on what the right thing to do is w.r.t. cwd
changes within tasks & specifically within appends/prepends to tasks?

