Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 30B7B60124
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 10:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id F4035315D05E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 11:17:35 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id NhgHJtwrQdUI
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 11:17:30 +0100 (CET)
Received: from [172.22.22.61] (55d44396.access.ecotel.net [85.212.67.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 24FF3315CF63
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 11:17:30 +0100 (CET)
To: openembedded-core@lists.openembedded.org
References: <alpine.LFD.2.20.1512070440340.13574@localhost>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <56655CB9.2050500@opendreambox.org>
Date: Mon, 7 Dec 2015 11:17:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1512070440340.13574@localhost>
Subject: Re: what feature fixed the gcc-5 preprocessor build error from a few months back?
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
X-List-Received-Date: Mon, 07 Dec 2015 10:17:39 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hello Robert,

On 07.12.2015 10:44, Robert P. J. Day wrote:
> 
>   once upon a time, i asked a question about the origin of this OE
> build error using gcc-5 to build ncurses-native:
> 
>> In file included from
> /home/rpjday/oe/builds/oe/qemux86/tmp-glibc/work/x86_64-linux/ncurses-native/5.9-r15.1/ncurses-5.9/ncurses/curses.priv.h:283:0,
>>                  from ../ncurses/lib_gen.c:19:
>> _20141.c:835:15: error: expected ')' before 'int'
>> ../include/curses.h:1594:56: note: in definition of macro
> 'mouse_trafo'
>>  #define mouse_trafo(y,x,to_screen)
> wmouse_trafo(stdscr,y,x,to_screen)
> 
>   it didn't take long to be pointed to an explanation on the fedora
> mailing list:
> 
> http://lists.openembedded.org/pipermail/openembedded-core/2015-February/101820.html
> 
> "	these packages failed to build because of the changes in the preprocessor;
> 	gcc started to generate line directives to better detect whether a macro
> 	tokens come from a system header - see http://gcc.gnu.org/PR60723
> 	The fix is to use the -P option if the code isn't prepared to deal with
> 	such directives.
> 
>   so i just added to my local.conf:
> 
> CPPFLAGS_append_pn-ncurses-native = " -P"
> 
>   that issue was apparently fixed and i haven't needed to do that for
> a while. however, i'm now using someone's custom version of OE-core
> and that very error is back, so what was it that was tweaked to deal
> with it? thanks.

see this commit in fido:

commit 3a5435b371c84ec28b6936b8c8fa6541a592d061
Author: Martin Stolpe <martinstolpe@gmail.com>
Date:   Wed Jun 10 16:28:26 2015 +0200

    ncurses: fix native builds when host has gcc5

    GCC"s preprocessor starts to add newlines which are not
    handled properly by ncurses build system startin from
    version 5.0.

    See also: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7870

    Signed-off-by: Martin Stolpe <martin.stolpe@gmail.com>
    Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>

In master it's probably been solved by updating ncurses.

Regards,
Andreas

