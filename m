Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 292D1C9832F
	for <webhook@archiver.kernel.org>; Sat, 26 Sep 2026 19:03:21 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24407.1790449391913952684
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Sep 2026 12:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=H92RVKy2;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout03.t-online.de (Postfix) with SMTP id 8DF0FE5DF;
	Sat, 26 Sep 2026 21:03:09 +0200 (CEST)
Received: from [192.168.178.36] ([84.154.169.105]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xAXfx-2jQ3DE0; Sat, 26 Sep 2026 21:03:09 +0200
Date: Sat, 26 Sep 2026 21:03:02 +0200
From: "Markus Volk" <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH 2/5] cpan: survive the Makefile that MakeMaker
 rebuilds under us
To: Paul Barker <paul@pbarker.dev>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <3LJZLT.G4KW3H0GTOVM3@t-online>
In-Reply-To: <d090889df2d7b67661ba42e1ab91de9f9c22dd73.camel@pbarker.dev>
References: <20260922092411.262885-1-f_l_k@t-online.de>
	<20260922092411.262885-2-f_l_k@t-online.de>
	<d090889df2d7b67661ba42e1ab91de9f9c22dd73.camel@pbarker.dev>
X-Mailer: net.donnybeelo.Convey/50.2-1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-PpaRVNFLQbgT5J11zGQg"
X-TOI-EXPURGATEID: 150726::1790449389-7154098F-988EB6B5/0/0 CLEAN NORMAL
X-TOI-MSGID: 702da7c7-937b-477e-9254-f28a86d393aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790449389; i=f_l_k@t-online.de;
	bh=fYcvCK7qgAILvRvJpUmXv+0QP/0Ay/PWtY7ToefM7l0=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=H92RVKy2VlGNdhliP+mbnkDSfqOzfuwM//OMreGc7gmPUwCcGyqPRcPaoeP9hh9SC
	 5Z48aJ0JF6RFiSztHeS1cUXzuyuqEJWcqq9neCht/9+EHSGKCyd0Oro4WhJ78zCzK8
	 jsKiM2hq4OLoo2dDgJN2MZ3uok/jOgcHbN1ehyDGkFLkzrsSEWoV03lg7JmFwNnJLA
	 VA5oSbUIv9UEX1sDOeNY8QIWBbSV1b6Zm2l8LyqarrQ10mjDr+9KqqE9A3Wj2EzD5s
	 XwXIo5n9VVGx7NEUkziC4rB6SzWGbOWALhuhr7nW6xXjeHF3wfAYwFWm9pNxJGfcmk
	 jxylQ494H8vTQ==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Sep 2026 19:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246640

--=-PpaRVNFLQbgT5J11zGQg
Content-Type: text/plain; charset=iso-8859-13; format=flowed

Hi Paul,


> 
> The commit summary here is an excellent example of Claudish. I'm not
> really sure what it means... It could do with re-writing.

Thats true. I think I only could follow it because I knew which real 
issue this fixes for me.
The problem is, that I'm following more or less regulary the current 
master branch of
oe-core and whenever there have been changes to perl the following 
build breaks a few
perl recipes. that then required a '-c cleansstate' to become buildable 
again.

> I'm not really familiar with cpan packages - are we sure that none
> include a Makefile?

I wasn't sure about this either, but since “do_configure” generates 
a new Makefile, I left it in. However,
that isn't necessary to fix the actual problem.

> 
> We don't want surprise rebuilds during do_install.

I'll send a v2 that just ignores the different timestamp

On Sat, Sep 26 2026 at 15:05:24 +01:00:00, Paul Barker 
<paul@pbarker.dev> wrote:
> On Tue, 2026-09-22 at 11:23 +0200, Markus Volk wrote:
>>  ExtUtils::MakeMaker makes the generated Makefile depend on 
>> Config.pm and
>>  config.h from the perl it was configured against. 
>> do_prepare_recipe_sysroot
>>  stages those files fresh on every run, so their mtime can end up 
>> newer than
>>  a Makefile written by a do_configure that is still valid. make then
>>  regenerates the Makefile, prints "Please rerun the make command" 
>> and exits
>>  non-zero, which fails do_compile or do_install. Run make a second 
>> time in
>>  that case, which is what MakeMaker asks for; a run that fails for 
>> any other
>>  reason fails again. Also drop a stale Makefile before Makefile.PL 
>> runs, so
>>  a configure in a used work directory does not start from old 
>> settings.
>> 
>>  Reproduced with liburi-perl by touching Config.pm and config.h in 
>> the
>>  recipe sysroot and forcing do_install: it failed before the change 
>> and
>>  succeeds after it.
>> 
>>  AI-Generated: Uses Claude Code (Claude Opus 5)
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
> 
> Hi Markus,
> 
> The commit summary here is an excellent example of Claudish. I'm not
> really sure what it means... It could do with re-writing.
> 
>>  ---
>>   meta/classes-recipe/cpan.bbclass | 13 +++++++++++--
>>   1 file changed, 11 insertions(+), 2 deletions(-)
>> 
>>  diff --git a/meta/classes-recipe/cpan.bbclass 
>> b/meta/classes-recipe/cpan.bbclass
>>  index dbf44da9d2..0f7384786f 100644
>>  --- a/meta/classes-recipe/cpan.bbclass
>>  +++ b/meta/classes-recipe/cpan.bbclass
>>  @@ -23,6 +23,10 @@ export PERLHOSTLIB = 
>> "${STAGING_LIBDIR_NATIVE}/perl5/${@get_perl_version(d)}/"
>>   export PERLHOSTARCHLIB = 
>> "${STAGING_LIBDIR_NATIVE}/perl5/${@get_perl_version(d)}/${@get_perl_hostarch(d)}/"
>> 
>>   cpan_do_configure () {
>>  +	# A Makefile left behind by an earlier configure run would be 
>> used with the
>>  +	# settings it was generated with, so start from the Makefile.PL 
>> every time.
>>  +	rm -f Makefile
> 
> I'm not really familiar with cpan packages - are we sure that none
> include a Makefile?
> 
>>  +
>>   	yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL INSTALLDIRS=vendor 
>> NO_PERLLOCAL=1 NO_PACKLIST=1 PERL=$(which perl) ${EXTRA_CPANFLAGS}
>> 
>>   	# Makefile.PLs can exit with success without generating a
>>  @@ -57,12 +61,17 @@ do_configure:append:class-nativesdk() {
>>              -e 's:LD_RUN_PATH ?= ?"?[^"]*"?::g'
>>   }
>> 
>>  +# ExtUtils::MakeMaker regenerates the Makefile when the staged 
>> perl has become
>>  +# newer than it, and then exits asking for make to be rerun. Do 
>> that instead of
>>  +# failing the task; a run that fails for any other reason fails 
>> again.
>>   cpan_do_compile () {
>>  -	oe_runmake PASTHRU_INC="${CFLAGS}" LD="${CCLD}"
>>  +	oe_runmake_call PASTHRU_INC="${CFLAGS}" LD="${CCLD}" || \
>>  +		oe_runmake PASTHRU_INC="${CFLAGS}" LD="${CCLD}"
> 
> Are we sure this won't mask other issues? The staged perl becoming 
> newer
> than the generated Makefile should be a rare occurance, perhaps we can
> check for that before calling make and handle it explicitly?
> 
>>   }
>> 
>>   cpan_do_install () {
>>  -	oe_runmake DESTDIR="${D}" install_vendor
>>  +	oe_runmake_call DESTDIR="${D}" install_vendor || \
>>  +		oe_runmake DESTDIR="${D}" install_vendor
> 
> We don't want surprise rebuilds during do_install.
> 
>>   	for PERLSCRIPT in `grep -rIEl '#! *${bindir}/perl-native.*/perl' 
>> ${D}`; do
>>   		sed -i -e 's|${bindir}/perl-native.*/perl|/usr/bin/env 
>> nativeperl|' $PERLSCRIPT
>>   	done
> 
> Best regards,
> 
> --
> Paul Barker
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#246637): 
> <https://lists.openembedded.org/g/openembedded-core/message/246637>
> Mute This Topic: <https://lists.openembedded.org/mt/121371712/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-PpaRVNFLQbgT5J11zGQg
Content-Type: text/html; charset=iso-8859-13

<div id="convey-body" dir="auto"><div>Hi Paul,</div><div><br></div><div><br></div><div><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">
The commit summary here is an excellent example of Claudish. I'm not
really sure what it means... It could do with re-writing.</div></blockquote><div><span style="white-space-collapse: break-spaces;"><br></span></div></div><div><span style="white-space-collapse: break-spaces;">Thats true. I think I only could follow it because I knew which real issue this fixes for me.</span></div><div><span style="white-space-collapse: break-spaces;">The problem is, that I'm following more or less regulary the current master branch of</span></div><div><span style="white-space-collapse: break-spaces;">oe-core and whenever there have been changes to perl the following build breaks a few</span></div><div><span style="white-space-collapse: break-spaces;">perl recipes. that then required a '-c cleansstate' to become buildable again.</span></div><div><span style="white-space-collapse: break-spaces;"><br></span></div><div><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">I'm not really familiar with cpan packages - are we sure that none
include a Makefile?</div></blockquote><div><span style="white-space-collapse: break-spaces;"><br></span></div></div><div><span style="white-space-collapse: break-spaces;">I wasn't sure about this either, but since “do_configure” generates a new Makefile, I left it in. However,
that isn't necessary to fix the actual problem.</span></div><div><span style="white-space-collapse: break-spaces;"><br></span></div><div><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">
We don't want surprise rebuilds during do_install.</div></blockquote><div><span style="white-space-collapse: break-spaces;"><br></span></div></div><div><span style="white-space-collapse: break-spaces;">I'll send a v2 that just ignores the different timestamp</span></div></div><div id="convey-quote" dir="auto"><br>On Sat, Sep 26 2026 at 15:05:24 +01:00:00, Paul Barker &lt;paul@pbarker.dev&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">On Tue, 2026-09-22 at 11:23 +0200, Markus Volk wrote:
<blockquote> ExtUtils::MakeMaker makes the generated Makefile depend on Config.pm and
 config.h from the perl it was configured against. do_prepare_recipe_sysroot
 stages those files fresh on every run, so their mtime can end up newer than
 a Makefile written by a do_configure that is still valid. make then
 regenerates the Makefile, prints "Please rerun the make command" and exits
 non-zero, which fails do_compile or do_install. Run make a second time in
 that case, which is what MakeMaker asks for; a run that fails for any other
 reason fails again. Also drop a stale Makefile before Makefile.PL runs, so
 a configure in a used work directory does not start from old settings.
 
 Reproduced with liburi-perl by touching Config.pm and config.h in the
 recipe sysroot and forcing do_install: it failed before the change and
 succeeds after it.
 
 AI-Generated: Uses Claude Code (Claude Opus 5)
 Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
</blockquote>
Hi Markus,

The commit summary here is an excellent example of Claudish. I'm not
really sure what it means... It could do with re-writing.

<blockquote> ---
  meta/classes-recipe/cpan.bbclass | 13 +++++++++++--
  1 file changed, 11 insertions(+), 2 deletions(-)
 
 diff --git a/meta/classes-recipe/cpan.bbclass b/meta/classes-recipe/cpan.bbclass
 index dbf44da9d2..0f7384786f 100644
 --- a/meta/classes-recipe/cpan.bbclass
 +++ b/meta/classes-recipe/cpan.bbclass
 @@ -23,6 +23,10 @@ export PERLHOSTLIB = "${STAGING_LIBDIR_NATIVE}/perl5/${@get_perl_version(d)}/"
  export PERLHOSTARCHLIB = "${STAGING_LIBDIR_NATIVE}/perl5/${@get_perl_version(d)}/${@get_perl_hostarch(d)}/"
  
  cpan_do_configure () {
 +	# A Makefile left behind by an earlier configure run would be used with the
 +	# settings it was generated with, so start from the Makefile.PL every time.
 +	rm -f Makefile
</blockquote>
I'm not really familiar with cpan packages - are we sure that none
include a Makefile?

<blockquote> +
  	yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL INSTALLDIRS=vendor NO_PERLLOCAL=1 NO_PACKLIST=1 PERL=$(which perl) ${EXTRA_CPANFLAGS}
  
  	# Makefile.PLs can exit with success without generating a
 @@ -57,12 +61,17 @@ do_configure:append:class-nativesdk() {
             -e 's:LD_RUN_PATH ?= ?"?[^"]*"?::g'
  }
  
 +# ExtUtils::MakeMaker regenerates the Makefile when the staged perl has become
 +# newer than it, and then exits asking for make to be rerun. Do that instead of
 +# failing the task; a run that fails for any other reason fails again.
  cpan_do_compile () {
 -	oe_runmake PASTHRU_INC="${CFLAGS}" LD="${CCLD}"
 +	oe_runmake_call PASTHRU_INC="${CFLAGS}" LD="${CCLD}" || \
 +		oe_runmake PASTHRU_INC="${CFLAGS}" LD="${CCLD}"
</blockquote>
Are we sure this won't mask other issues? The staged perl becoming newer
than the generated Makefile should be a rare occurance, perhaps we can
check for that before calling make and handle it explicitly?

<blockquote>  }
  
  cpan_do_install () {
 -	oe_runmake DESTDIR="${D}" install_vendor
 +	oe_runmake_call DESTDIR="${D}" install_vendor || \
 +		oe_runmake DESTDIR="${D}" install_vendor
</blockquote>
We don't want surprise rebuilds during do_install.

<blockquote>  	for PERLSCRIPT in `grep -rIEl '#! *${bindir}/perl-native.*/perl' ${D}`; do
  		sed -i -e 's|${bindir}/perl-native.*/perl|/usr/bin/env nativeperl|' $PERLSCRIPT
  	done
</blockquote>
Best regards,

<div>-- 
</div>Paul Barker

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#246637): <a href="https://lists.openembedded.org/g/openembedded-core/message/246637">https://lists.openembedded.org/g/openembedded-core/message/246637</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/121371712/3618223">https://lists.openembedded.org/mt/121371712/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-PpaRVNFLQbgT5J11zGQg--


