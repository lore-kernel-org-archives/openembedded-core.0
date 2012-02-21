Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1RzxCJ-0000Zs-QW
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 22:24:32 +0100
Received: by obhx4 with SMTP id x4so9530469obh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 13:16:11 -0800 (PST)
Received-SPF: pass (google.com: domain of sakoman@gmail.com designates
	10.182.75.102 as permitted sender) client-ip=10.182.75.102; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of sakoman@gmail.com
	designates 10.182.75.102 as permitted sender)
	smtp.mail=sakoman@gmail.com;
	dkim=pass header.i=sakoman@gmail.com
Received: from mr.google.com ([10.182.75.102])
	by 10.182.75.102 with SMTP id b6mr17157827obw.9.1329858971933 (num_hops
	= 1); Tue, 21 Feb 2012 13:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=jRg0Ex/GhnB7HELALhH3KnE1GqREVKiz+JtzXhABHuY=;
	b=meQXNV7wiujLX/WsX80+W0gKJYf3cab5h0WesfviMeF2uxQ5j4+H+L0qf+/fyYHyMJ
	Ec+dl1Or1bo+W7/iQIYMQNUD3NpqvlB76Sfg9b8NnST9i90fiNhzcH8qCeoP4UWqRh/w
	2y2Hi4Kw3k815jxNmP7/GVGf4micoq6/MsoP4=
MIME-Version: 1.0
Received: by 10.182.75.102 with SMTP id b6mr14557607obw.9.1329858971884; Tue,
	21 Feb 2012 13:16:11 -0800 (PST)
Received: by 10.182.246.8 with HTTP; Tue, 21 Feb 2012 13:16:11 -0800 (PST)
In-Reply-To: <CAMKF1sqMP5yyeFo8qUhjd1xPkOvV6JcpzSwRP33VNyc0wf+C_A@mail.gmail.com>
References: <cover.1329147583.git.Martin.Jansa@gmail.com>
	<1e2722b29db9486276198e13f06345babce10518.1329147583.git.Martin.Jansa@gmail.com>
	<4cb8ea6acd12fec8ff072912292a374aaac56dcb.1329147583.git.Martin.Jansa@gmail.com>
	<CAGDS+nkxwj33z1zP2Uc9+oH97WkOy_v0yP2cs0VDcDgxm3SYog@mail.gmail.com>
	<CAMKF1sqMP5yyeFo8qUhjd1xPkOvV6JcpzSwRP33VNyc0wf+C_A@mail.gmail.com>
Date: Tue, 21 Feb 2012 13:16:11 -0800
Message-ID: <CAGDS+nn7+3zVFX896P-+y5tT4Xw-++bgKtizmDsFZUno5D9Y8A@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH 4/4] recipes: bump PR to rebuild .la files without libz.la
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Feb 2012 21:24:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 21, 2012 at 1:07 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Feb 21, 2012 at 11:25 AM, Steve Sakoman <sakoman@gmail.com> wrote:
>>
>> | configure: error: Package requirements (cairo-xlib >= 1.6) were not met:
>> |
>> | No package 'cairo-xlib' found
>
> Add DEPENDS += "cairo"

Nope, cairo is already in the DEPENDS list for gtk+.

Seems the issue is that on that build machine (the 4 core) cairo isn't
being built with --with-x=yes.

The cairo recipe checks for x11 in DISTRO_FEATURES and does
--with-x=yes if it is present.

Since Poky doesn't have x11 in DISTRO_FEATURES, cairo builds without
xlib support by default.

On my other build machine (the 8 core) some other package must be
triggering cairo to build with xlib enabled and I don't get the gtk+
error.

Not sure what the proper fix is.  Suggestions welcome.  In order to
get work done I'll probably append x11 to distro features in my layer
and deal with it when I have more time.

Steve


