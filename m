Return-Path: <tylerwhall@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id D6EB46007C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2013 14:04:20 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id fp13so324044lab.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2013 07:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=E3BapHpGZjS8H2Nl/popd+NRCmYvIp+8R4KbvWNL27U=;
	b=svFGdoStE80XL7MdXGaplXsvTtOGjCXnUXF1PWKFhPCcQQ5bylJDcAs3FAFNmBDO3E
	nUGfnyO1ftOYscJzd9/mwkWEaDXm8IpwIhRjx1UWkgpR5PVX4Eg4E5wa2wVIZRMDkJvs
	Kc3RkRNyvLzQhUdDLMCWhVt08e1OEzqmM2HVhGyGxrnAkWTHUbhEWeBgww4iunmUVU0C
	0T3hhWYgnb/NfgvAiWs5XRk+baqGFPuFp4SLocgRw7IivyxsasV3NM/53JvtFC+KUpKs
	UTjdJb76ZUKCNozXvII2tEDhHUMQGpTQMVjDaW/JErO2xvUN1OlGoiROBUNzmTDa2Dte
	dbBg==
X-Received: by 10.112.57.49 with SMTP id f17mr1364363lbq.26.1375797860817;
	Tue, 06 Aug 2013 07:04:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.114.97.167 with HTTP; Tue, 6 Aug 2013 07:04:00 -0700 (PDT)
In-Reply-To: <520016FF.7000104@linux.intel.com>
References: <1375712720-16668-1-git-send-email-tylerwhall@gmail.com>
	<520016FF.7000104@linux.intel.com>
From: Tyler Hall <tylerwhall@gmail.com>
Date: Tue, 6 Aug 2013 10:04:00 -0400
Message-ID: <CAOjnSCYHARqHnZAOpahOnPDLXD7t=p4wbHz051HzMrcWR+F3ow@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cpan-base: Don't use immediate expansion
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
X-List-Received-Date: Tue, 06 Aug 2013 14:04:21 -0000
Content-Type: multipart/alternative; boundary=001a1133eacac6e41704e347e6ae

--001a1133eacac6e41704e347e6ae
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Aug 5, 2013 at 5:19 PM, Saul Wold <sgw@linux.intel.com> wrote:

> I could not replicate this, can you provide more details about how you
> setup the failure, was it from a clean sstate?
>

 It was with clean sstate, but I can switch between libxml-sax-perl task
hashes with a regular clean or setscene of perl. In my existing workspace,
I ran

$ bitbake -c clean perl
$ STAMPS_DIR=perl-stamps bitbake -S libxml-sax-perl
$ bitbake perl # From sstate
$ STAMPS_DIR=perl-stamps bitbake -S libxml-sax-perl

and got the error for several do_package tasks
ERROR: Bitbake's cached basehash does not match the one we just generated
(/.../oe-core/meta/recipes-extended/perl/libxml-sax-base-perl_1.08.bb.do_package)!

I think you have to trigger a re-parse (which -S seems to do) since the
perl files being in the sysroot wouldn't invalidate the cache.

Are you working with master or 1.4 or something else?
>

I first noticed it on 1.4 and reproduced it on master, which was
09deeef20ee5a0c12ad4fd89cace6e0fb832d5b1 at the time.

Thanks,
Tyler

--001a1133eacac6e41704e347e6ae
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On M=
on, Aug 5, 2013 at 5:19 PM, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"mail=
to:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;</span=
> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"im"></div>
I could not replicate this, can you provide more details about how you setu=
p the failure, was it from a clean sstate?<br></blockquote><div>=A0</div><d=
iv>=A0It was with clean sstate, but I can switch between libxml-sax-perl ta=
sk hashes with a regular clean or setscene of perl. In my existing workspac=
e, I ran<br>

<br></div><div>$ bitbake -c clean perl<br></div><div>$ STAMPS_DIR=3Dperl-st=
amps bitbake -S libxml-sax-perl<br></div><div>$ bitbake perl # From sstate<=
br></div><div>$ STAMPS_DIR=3Dperl-stamps bitbake -S libxml-sax-perl<br><br>

and got the error for several do_package tasks<br><div style=3D"margin-left=
:40px">ERROR: Bitbake&#39;s cached basehash does not match the one we just =
generated (/.../oe-core/meta/recipes-extended/perl/libxml-sax-base-perl_1.0=
8.bb.do_package)!<br>

</div><br></div><div>I think you have to trigger a re-parse (which -S seems=
 to do) since the perl files being in the sysroot wouldn&#39;t invalidate t=
he cache.<br><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">


Are you working with master or 1.4 or something else?<br></blockquote><div>=
=A0</div><div>I first noticed it on 1.4 and reproduced it on master, which =
was 09deeef20ee5a0c12ad4fd89cace6e0fb832d5b1 at the time.<br><br></div><div=
>

Thanks,<br>Tyler<br></div><br></div></div></div>

--001a1133eacac6e41704e347e6ae--
