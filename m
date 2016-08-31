Return-Path: <geiseri@geekcentral.pub>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
	[74.201.84.163])
	by mail.openembedded.org (Postfix) with ESMTP id 6BD006FEFE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 18:38:23 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zoho; d=geekcentral.pub; 
	h=date:from:cc:message-id:in-reply-to:references:subject:mime-version:content-type:user-agent;
	b=XEE8eeoslihWVZ6sfVI23snJzN9F1fFCdngFaldpuHZFvABahE3bN2hoW1SSUCOjeFlwDEeMSSs9
	a2Vh1/qign5iC7za3+C+6azcoYRw1EqvOqA2ssrWUL1UoDToHUQyjX0Wl7qwSeSI7/O4eK3M0Jc0
	YtG3e3BaFog2UkiXh6I=  
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1472668701656419.72673297400263;
	Wed, 31 Aug 2016 11:38:21 -0700 (PDT)
Date: Wed, 31 Aug 2016 14:38:21 -0400
From: Ian Geiser <geiseri@geekcentral.pub>
Cc: "openembedded-core" <openembedded-core@lists.openembedded.org>
Message-ID: <156e1e513d5.c474d9aa54721.2629815168808718551@geekcentral.pub>
In-Reply-To: <156dbcc9234.fecba7bb134253.7144318255325985625@geekcentral.pub>
References: <156dbcc9234.fecba7bb134253.7144318255325985625@geekcentral.pub>
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
X-List-Received-Date: Wed, 31 Aug 2016 18:38:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


 ---- On Tue, 30 Aug 2016 10:13:52 -0400 Ian Geiser <geiseri@geekcentral.pub> wrote ---- 
 > Greetings,  I have an issue where I cannot seem to build any external kernel module recipes.  The one in particular is iscsitarget, but it seems none of them build now. 
 >  
 > It seems that what is happening is that the "work-shared/*/kernel-build-artifacts" is getting erased right before the module recipe tries to use them.  Has anyone seen this before? 
 >  
 > As a key point, I am also using my own kernel recipe that only uses the kernel.bbclass, not the kernel-yocto.bbclass.  Is there magic I am missing that will not allow me to build modules unless I am using the yocto kernels? 
 >  
 
Looking at this further it looks like this is a normal issue with all kernels.  There is a race condition that will cause the kernel to rebuild everytime you build a module.  During this process the build artifacts are always cleared out and sometimes it wont actually populate the shared workdir.  I tested with most kernels and found all modules suffer this issue.  Am I the only one seeing this?


