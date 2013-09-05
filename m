Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6C81761855
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 13:00:12 +0000 (UTC)
Received: by mail-oa0-f44.google.com with SMTP id l17so2124188oag.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2013 06:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=qDWyKJPbVxsODtxlI9+EcYi2cBgBjWsjdcSEH4rKVi8=;
	b=etEmBOUI7Sr9qe2ReHhbGSnTJiCKLUMdSdyEOlUOGL/ISVesmKe+D+mS241t9wtbVm
	eSnIg2KH58C4R9NTpKR4s1FbcND0DOZpVsr2+I+vLKwyFXnJTSRYXXaAZfjDERlX+sHz
	Oa82u3VeN6yiD7GsN7fuvIa4eQpxDq1fYPtNvhhSk5EIW1v32UU2zBfefcz3pubsz3Q9
	W3+6VlOgZIRbRtdUVMwdKLyEAW8/IdA8J28yOxgf3DvGD2qMF7Pippsg7X7C5fHAyp0B
	JGT3DRcbPxSEbrS3gxRToNchUNOFNJbWEZsJgnyg26VLxXwfl1tFYY0osTneeLoH14A+
	cbeQ==
MIME-Version: 1.0
X-Received: by 10.182.81.65 with SMTP id y1mr6313672obx.89.1378386014249; Thu,
	05 Sep 2013 06:00:14 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 5 Sep 2013 06:00:14 -0700 (PDT)
In-Reply-To: <1378369981.32427.23.camel@ted>
References: <cover.1378361078.git.nitin.a.kamble@intel.com>
	<2b4e12bfea634eaecac61b471a9d607fe127d1cd.1378361078.git.nitin.a.kamble@intel.com>
	<1378369981.32427.23.camel@ted>
Date: Thu, 5 Sep 2013 10:00:14 -0300
X-Google-Sender-Auth: XAIb9R5NGoNYGBIDNUex4wHVODw
Message-ID: <CAP9ODKq99q3zFQHhYqv7dimaCkTk2jzuUwraaDGhyjhztoyaoA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: meta-intel@yoctoproject.org, darren.hart@intel.com,
	Saul Wold <saul.wold@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Patch-v2 1/1] mesa: avoid unnecessary rerunning of tasks
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
X-List-Received-Date: Thu, 05 Sep 2013 13:00:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 5, 2013 at 5:33 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
....
> This also raises some other questions. The existing code in meta-intel
> adds EMGD into the DEPENDS. It does this so the normal PROVIDES for
> virtual/libgl and friends don't have to change. It does mean the sstate
> checksums for anything depending on mesa change however. If we don't
> have the dependency, things may try and build before emgd is built,
> libGL would be missing and things would break.
>
> So somehow we need to add in the dependency let leave the sstate
> checksums unchanged. This is possible in the sstate checksum validation
> code but its probably easiest to change that in the core, not
> meta-intel :/.
>
> I'd also appreciate someone (Ross maybe?) confirming that if we build
> application A against mesa, then change over to a machine that uses emgd
> and swizzle the libs around in the sysroot, do we need to recompile the
> app? This approach is assuming we do not need to do that. If we do,
> there is a different approach we need to take.

In theory both cases are possible; the API must be the same but we
cannot guarantee ABI will match.

> So in summary, this problem is far from simple, we do have most of the
> pieces we need to fix it with some tweaking but some of the changes are
> invasive and might need to be deferred to 1.6. As it stands, the change
> will cause issues due to the changed DEPENDS. We do need to think
> carefully about this and solve it once and for all in a way which works
> optimally but the existing workaround might be best until we can pull
> all the better pieces together.
>
> I hope this was a relatively clear explanation of the problem, let me
> know if I need to clarify anything. I've cc'd OE-Core since I think more
> people probably need to see/think about this.

We have same issues in meta-fsl-arm; there we made mesa and gpu
packages machine specific as we /mangle/ them.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

