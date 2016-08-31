Return-Path: <geiseri@geekcentral.pub>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
	[74.201.84.163])
	by mail.openembedded.org (Postfix) with ESMTP id 0CEA1734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 20:33:33 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zoho; d=geekcentral.pub; 
	h=date:from:cc:message-id:in-reply-to:references:subject:mime-version:content-type:user-agent;
	b=OcDpiD0SDnV52jHBPjzbWAFRRPM1G140N4lH1+Wxb+Erjm4r2ptY8lVzLkrfA1xbrn+duD/2JUih
	CBVoLBibe9Nd+iWPuJnxCNt/7SuKdFguRXZU8uDdyos7NdimJ/8wAKTMfWP6KD29rLb5XSq3a6J5
	2XaZkS2CzIZyla5gAVU=  
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1472675611218932.8179557952391;
	Wed, 31 Aug 2016 13:33:31 -0700 (PDT)
Date: Wed, 31 Aug 2016 16:33:31 -0400
From: Ian Geiser <geiseri@geekcentral.pub>
Cc: "openembedded-core" <openembedded-core@lists.openembedded.org>
Message-ID: <156e24e824f.d13a4a6b63702.4643636063133671065@geekcentral.pub>
In-Reply-To: <CA+chaQePytMyqg3aVSC_2yiDDgCEeJj8hOscuJN+DY1J=FEdCw@mail.gmail.com>
References: <156dbcc9234.fecba7bb134253.7144318255325985625@geekcentral.pub>
	<156e1e513d5.c474d9aa54721.2629815168808718551@geekcentral.pub>
	<CA+chaQePytMyqg3aVSC_2yiDDgCEeJj8hOscuJN+DY1J=FEdCw@mail.gmail.com>
MIME-Version: 1.0
X-Priority: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Subject: Re: Cannot build any external kernel modules in krogoth
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
X-List-Received-Date: Wed, 31 Aug 2016 20:33:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


Can this get backported to krogoth?  For now i am just putting my kernel in RM_WORK_EXCLUDE and that seems to be working properly.  Thanks for the hint!

 ---- On Wed, 31 Aug 2016 15:07:16 -0400 Martin Jansa <martin.jansa@gmail.com> wrote ---- 
 > You're not alone, this might be the same issue (fixed only in master):https://bugzilla.yoctoproject.org/show_bug.cgi?id=9352
 > 
 > On Wed, Aug 31, 2016 at 8:38 PM, Ian Geiser <geiseri@geekcentral.pub> wrote:
 > 
 >   ---- On Tue, 30 Aug 2016 10:13:52 -0400 Ian Geiser <geiseri@geekcentral.pub> wrote ----
 >   > Greetings,  I have an issue where I cannot seem to build any external kernel module recipes.  The one in particular is iscsitarget, but it seems none of them build now.
 >   >
 >   > It seems that what is happening is that the "work-shared/*/kernel-build-artifacts" is getting erased right before the module recipe tries to use them.  Has anyone seen this before?
 >   >
 >   > As a key point, I am also using my own kernel recipe that only uses the kernel.bbclass, not the kernel-yocto.bbclass.  Is there magic I am missing that will not allow me to build modules unless I am using the yocto kernels?
 >   >
 >  
 >  Looking at this further it looks like this is a normal issue with all kernels.  There is a race condition that will cause the kernel to rebuild everytime you build a module.  During this process the build artifacts are always cleared out and sometimes it wont actually populate the shared workdir.  I tested with most kernels and found all modules suffer this issue.  Am I the only one seeing this?
 >  
 >  --
 >  _______________________________________________
 >  Openembedded-core mailing list
 >  Openembedded-core@lists.openembedded.org
 >  http://lists.openembedded.org/mailman/listinfo/openembedded-core
 >  
 >  



