Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 047C9605BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 18:03:54 +0000 (UTC)
Received: from elite.brightsigndigital.co.uk ([213.210.30.29]
	helo=phil-desktop) by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <pb@pbcl.net>)
	id 1ain8M-0005f8-Ri; Wed, 23 Mar 2016 19:03:55 +0100
Message-ID: <1458756234.3476.189.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Mar 2016 18:03:54 +0000
In-Reply-To: <CAJTo0LbicCM6LJbxEK8m-QES49-WjPJsDUgduV0-dOg1FSEdZw@mail.gmail.com>
References: <1458748461-4643-1-git-send-email-william.c.randle@intel.com>
	<1458755798.3476.186.camel@pbcl.net>
	<CAJTo0LbicCM6LJbxEK8m-QES49-WjPJsDUgduV0-dOg1FSEdZw@mail.gmail.com>
X-Mailer: Evolution 3.18.3-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] insane.bbclass: tighten lib_re and exec_re patterns to avoid false positive
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
X-List-Received-Date: Wed, 23 Mar 2016 18:03:55 -0000
Content-Type: multipart/alternative; boundary="=-MXc/9Iq9v01BNK7CnpjH"

--=-MXc/9Iq9v01BNK7CnpjH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-03-23 at 17:59 +0000, Burton, Ross wrote:
> 
> On 23 March 2016 at 17:56, Phil Blundell <pb@pbcl.net> wrote:
> > > lib_re would match files like "/libsoletta.so.0.0.1-gdb.py" which
> > are
> > > not valid library filenames.
> > 
> > What are the consequences of it matching things that are not
> > libraries?
> See #9215, the libdir sanity test fires when it shouldn't.
> 
> WARNING: QA Issue: soletta-dbg: found library in wrong location:
> /usr/share/gdb/auto-load/libsoletta.so.0.0.1-gdb.py [libdir]
> 
> That's no library...
Ah, right. I see.
I wonder if we should just give insane.bbclass a whitelist of
directories in which it should ignore apparently misplaced libraries.
 There aren't likely to be many cases like that one.
Or alternatively, add an extra check so that when it thinks it's found
a misplaced library, it checks the ELF header to make sure that it
really is one and suppresses the diagnostic if not.  If you only do
this in cases where it was about to print a warning anyway then the
impact on performance shouldn't be too bad.
p.

--=-MXc/9Iq9v01BNK7CnpjH
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html><head></head><body><div>On Wed, 2016-03-23 at 17:59 +0000, Burton, Ross wrote:</div><blockquote type="cite"><div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On 23 March 2016 at 17:56, Phil Blundell <span dir="ltr">&lt;<a href="mailto:pb@pbcl.net" target="_blank">pb@pbcl.net</a>&gt;</span> wrote:<br><blockquote type="cite"><span class="">&gt; lib_re would match files like "/<a href="http://libsoletta.so.0.0.1-gdb.py" rel="noreferrer" target="_blank">libsoletta.so.0.0.1-gdb.py</a>" which are<br>
&gt; not valid library filenames.<br>
<br>
</span>What are the consequences of it matching things that are not libraries?<br></blockquote></div><br>See #9215, the libdir sanity test fires when it shouldn't.</div><br>WARNING: QA Issue: soletta-dbg: found library in wrong location: /usr/share/gdb/auto-load/<a href="http://libsoletta.so.0.0.1-gdb.py">libsoletta.so.0.0.1-gdb.py</a> [libdir]<br><br><div>That's no library...</div></div>
</blockquote><div><br></div><div>Ah, right. I see.</div><div><br></div><div>I wonder if we should just give insane.bbclass a whitelist of directories in which it should ignore apparently misplaced libraries. &nbsp;There aren't likely to be many cases like that one.</div><div><br></div><div>Or alternatively, add an extra check so that when it thinks it's found a misplaced library, it checks the ELF header to make sure that it really is one and suppresses the diagnostic if not. &nbsp;If you only do this in cases where it was about to print a warning anyway then the impact on performance shouldn't be too bad.</div><div><br></div><div>p.</div><div><br></div></body></html>

--=-MXc/9Iq9v01BNK7CnpjH--
