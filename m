Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 38D016612D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 09:58:27 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1ZyzVS-00070F-Mv; Wed, 18 Nov 2015 10:58:27 +0100
Message-ID: <1447840697.4042.13.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 Nov 2015 09:58:17 +0000
In-Reply-To: <1447780178.1472.29.camel@pbcl.net>
References: <1447739760-14395-1-git-send-email-armccurdy@gmail.com>
	<1447773377.1472.28.camel@pbcl.net>
	<CAJTo0La98Rv=0ZwdHce4FTknVAmZnGEnNmpXopK9+8cKqbnj8Q@mail.gmail.com>
	<1447780178.1472.29.camel@pbcl.net>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: mcrowe@brightsign.biz, tgover@brightsign.biz,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] directfb.inc: force bfd linker for armv7a
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
X-List-Received-Date: Wed, 18 Nov 2015 09:58:29 -0000
Content-Type: multipart/alternative; boundary="=-zGI/O5mjEmUk0dcSeVy5"

--=-zGI/O5mjEmUk0dcSeVy5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-11-17 at 17:09 +0000, Phil Blundell wrote:
> On Tue, 2015-11-17 at 16:44 +0000, Burton, Ross wrote:
> > 
> > 
> > On 17 November 2015 at 15:16, Phil Blundell <pb@pbcl.net> wrote:
> > 
> > > Does the resulting directfb-csource binary actually work with that
> > > change?  My recollection is that ld.bfd will just silently permit
> > > relocs that gold (correctly) refuses to allow.
> > > 
> > > 
> > 
> > 
> > Personally I don't use DirectFB (and am constantly surprised it's
> > still a thing) so at this point I'm not going to merge either of
> > these patches until someone can confirm that their fix *works on
> > hardware* instead of just fixing the build.
> 
> 
> I think that's a reasonable position.  In any case, the underlying
> issue is a compiler bug and ought really to be fixed there rather than
> patching directfb or any other package that just happens to fall over
> it.

I had another look at this and my previous recollection was not quite
right.  What's happening here is that we have:

        movw    r1, #:lower16:longjmp
        mov     r2, #392
        movt    r1, #:upper16:longjmp
        bl      png_set_longjmp_fn

which is not an unreasonable thing for the compiler to generate in the
circumstances and results in the assembler producing:

00000798  0000722b R_ARM_MOVW_ABS_NC 00000000   longjmp
000007a0  0000722c R_ARM_MOVT_ABS    00000000   longjmp

   114: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND longjmp

which is also fine.  However gold is getting a bit mixed up and seems to
be forgetting to generate a plt entry for longjmp.  Instead it tries to
produce:

0000a124  0000132b R_ARM_MOVW_ABS_NC 00000000   longjmp
0000a12c  0000132c R_ARM_MOVT_ABS    00000000   longjmp

    19: 00000000     0 FUNC    GLOBAL DEFAULT  UND longjmp@GLIBC_2.4 (4)
   104: 00000000     0 FUNC    GLOBAL DEFAULT  UND longjmp

which is bogus.

So, contrary to what I said before, I don't think gcc is doing anything
wrong and it seems fairly clear that the bug is in gold.  That being the
case, I think switching to ld.bfd is a reasonable workaround.  Adding
-fPIC also works around the problem in a different way (it replaces the
MOVx_ABS relocs with a load from the constant pool and a corresponding
GLOB_DAT reloc) but this will produce worse code.  So I would be
inclined to merge Andre's patch.  If someone wanted to distil a testcase
from this and file a bug against gold upstream then that would be even
better.

p.


--=-zGI/O5mjEmUk0dcSeVy5
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/4.8.5">
</HEAD>
<BODY>
On Tue, 2015-11-17 at 17:09 +0000, Phil Blundell wrote:
<BLOCKQUOTE TYPE=CITE>
    On Tue, 2015-11-17 at 16:44 +0000, Burton, Ross wrote:
</BLOCKQUOTE>
<BLOCKQUOTE TYPE=CITE>
    <BLOCKQUOTE TYPE=CITE>
        <BR>
    </BLOCKQUOTE>
</BLOCKQUOTE>
<BLOCKQUOTE TYPE=CITE>
    <BLOCKQUOTE TYPE=CITE>
        On 17 November 2015 at 15:16, Phil Blundell &lt;<A HREF="mailto:pb@pbcl.net">pb@pbcl.net</A>&gt; wrote:
    </BLOCKQUOTE>
</BLOCKQUOTE>
<BLOCKQUOTE TYPE=CITE>
    <BLOCKQUOTE TYPE=CITE>
        <BLOCKQUOTE TYPE=CITE>
            Does the resulting directfb-csource binary actually work with that<BR>
            change?&nbsp; My recollection is that ld.bfd will just silently permit<BR>
            relocs that gold (correctly) refuses to allow.
        </BLOCKQUOTE>
    </BLOCKQUOTE>
</BLOCKQUOTE>
<BLOCKQUOTE TYPE=CITE>
    <BLOCKQUOTE TYPE=CITE>
        <BLOCKQUOTE TYPE=CITE>
            <BR>
        </BLOCKQUOTE>
    </BLOCKQUOTE>
</BLOCKQUOTE>
<BLOCKQUOTE TYPE=CITE>
    <BLOCKQUOTE TYPE=CITE>
        <BR>
        Personally I don't use DirectFB (and am constantly surprised it's still a thing) so at this point I'm not going to merge either of these patches until someone can confirm that their fix *works on hardware* instead of just fixing the build.
    </BLOCKQUOTE>
</BLOCKQUOTE>
<BLOCKQUOTE TYPE=CITE>
    <BR>
    <BR>
</BLOCKQUOTE>
<BLOCKQUOTE TYPE=CITE>
    I think that's a reasonable position. &nbsp;In any case, the underlying issue is a compiler bug and ought really to be fixed there rather than patching directfb or any other package that just happens to fall over it.
</BLOCKQUOTE>
<BR>
I had another look at this and my previous recollection was not quite right.&nbsp; What's happening here is that we have:<BR>
<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; movw&nbsp;&nbsp;&nbsp; r1, #:lower16:longjmp<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mov&nbsp;&nbsp;&nbsp;&nbsp; r2, #392<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; movt&nbsp;&nbsp;&nbsp; r1, #:upper16:longjmp<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bl&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; png_set_longjmp_fn<BR>
<BR>
which is not an unreasonable thing for the compiler to generate in the circumstances and results in the assembler producing:<BR>
<BR>
00000798&nbsp; 0000722b R_ARM_MOVW_ABS_NC 00000000&nbsp;&nbsp; longjmp<BR>
000007a0&nbsp; 0000722c R_ARM_MOVT_ABS&nbsp;&nbsp;&nbsp; 00000000&nbsp;&nbsp; longjmp<BR>
<BR>
&nbsp;&nbsp; 114: 00000000&nbsp;&nbsp;&nbsp;&nbsp; 0 NOTYPE&nbsp; GLOBAL DEFAULT&nbsp; UND longjmp<BR>
<BR>
which is also fine.&nbsp; However gold is getting a bit mixed up and seems to be forgetting to generate a plt entry for longjmp.&nbsp; Instead it tries to produce:<BR>
<BR>
0000a124&nbsp; 0000132b R_ARM_MOVW_ABS_NC 00000000&nbsp;&nbsp; longjmp<BR>
0000a12c&nbsp; 0000132c R_ARM_MOVT_ABS&nbsp;&nbsp;&nbsp; 00000000&nbsp;&nbsp; longjmp<BR>
<BR>
&nbsp;&nbsp;&nbsp; 19: 00000000&nbsp;&nbsp;&nbsp;&nbsp; 0 FUNC&nbsp;&nbsp;&nbsp; GLOBAL DEFAULT&nbsp; UND longjmp@GLIBC_2.4 (4)<BR>
&nbsp;&nbsp; 104: 00000000&nbsp;&nbsp;&nbsp;&nbsp; 0 FUNC&nbsp;&nbsp;&nbsp; GLOBAL DEFAULT&nbsp; UND longjmp<BR>
<BR>
which is bogus.<BR>
<BR>
So, contrary to what I said before, I don't think gcc is doing anything wrong and it seems fairly clear that the bug is in gold.&nbsp; That being the case, I think switching to ld.bfd is a reasonable workaround.&nbsp; Adding -fPIC also works around the problem in a different way (it replaces the MOVx_ABS relocs with a load from the constant pool and a corresponding GLOB_DAT reloc) but this will produce worse code.&nbsp; So I would be inclined to merge Andre's patch.&nbsp; If someone wanted to distil a testcase from this and file a bug against gold upstream then that would be even better.<BR>
<BR>
p.<BR>
<BR>
</BODY>
</HTML>

--=-zGI/O5mjEmUk0dcSeVy5--
