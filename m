Return-Path: <geiseri@geekcentral.pub>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
	[74.201.84.163])
	by mail.openembedded.org (Postfix) with ESMTP id 63935771E3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 15:32:11 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zoho; d=geekcentral.pub; 
	h=date:from:to:cc:message-id:in-reply-to:references:subject:mime-version:content-type:user-agent;
	b=PlRlkNdErIp4clnfIZ8cBkYMCVEXcppU5gU7JYuWNzB5ZICzT0Z3RR4tHec8EVgcF1fyyJvhNjeA
	hvFKrCSpTgwH6L7serfd2fmA88RqmZQ2H5hEDz76JZD+ptTosHUtRVHkEkLlXNOGMqkqR0iQWbob
	FB3sYJHPoCAiuiVwfc0=  
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 146470871917029.497647482349066;
	Tue, 31 May 2016 08:31:59 -0700 (PDT)
Date: Tue, 31 May 2016 11:31:59 -0400
From: Ian Geiser <geiseri@geekcentral.pub>
To: "Christopher Larson" <clarson@kergoth.com>
Message-ID: <15507716209.cd119ae329262.993815898734303688@geekcentral.pub>
In-Reply-To: <CABcZANnanW42b8kk6mdTzdFpcmXm_rkTQf0uVuanY8OBTTF5+A@mail.gmail.com>
References: <154c86e7fa2.11a4a3b0e305159.2603931524640206304@geekcentral.pub>
	<20160523103623.GA18324@linux.intel.com>
	<154dd88c4a6.d1f78c40166145.7475080368514196708@geekcentral.pub>
	<20160524195145.GA21158@linux.intel.com>
	<CABcZANnTRsoFWBdshg1mvV1AWvxjs_XqYb0horJwFSpqrswT6Q@mail.gmail.com>
	<20160524201600.GB21158@linux.intel.com>
	<CABcZANnRrT_mJ1WnahrKfNe2vS9z8BYvR3p1vacXt6siKSAJ0Q@mail.gmail.com>
	<20160525113549.GA25463@linux.intel.com>
	<CABcZANnanW42b8kk6mdTzdFpcmXm_rkTQf0uVuanY8OBTTF5+A@mail.gmail.com>
MIME-Version: 1.0
X-Priority: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Wic and "live" images
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
X-List-Received-Date: Tue, 31 May 2016 15:32:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

 ---- On Wed, 25 May 2016 16:04:50 -0400 Christopher Larson <clarson@kergoth.com> wrote ---- 
 > 
 > On Wed, May 25, 2016 at 4:35 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
 > 
 > It's debatable. As long as we keep the logic separated, such that anything bsp specific is in the machine or bsp layer, so the images are independent of any bsp, then we're fine. If we need to keep certain aspects of rootfs / image preparation outside of wic, then we'd need the machines which need such setup to use a hook to ensure it's applied to all images, i.e. an IMAGE_POSTPROCESS_COMMAND, and we'd need to document that.

If I follow in wic the logic is in the plugins.  So its up to the bsp to implement those.  Currently though we have tight coupling with efi and mbr in the oe-core libraries.  I guess this leads me into a false sense that wic is machine/bsp specific.

 > That might be doable, but we definitely need to give careful thought to what pieces of information about the image creation process come from where. Certain aspects are clearly distro, i.e. extra image space, and possibly other partitioning like splitting up the rootfs into multiple partitions, but others are clearly bsp, i.e. setup of a boot partition if the bootloader expects it, and image recipes need to work regardless of what distro or machine are selected.
 
This is what I get at by saying needing a "robust" library of common plugins that can be reused by the bsp authors.  I think this would allow the wks files to be more consistent and more reusable.   

Lastly, in the current vernacular am I confusing the terms "image" and "rootfs"?  In my mind "image" is the physical bits that will get burned into ROM/SSD/etc.   "rootfs" is the filesystem component that is injected somehow into the image.  Is this correct?


