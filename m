Return-Path: <geiseri@geekcentral.pub>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
	[74.201.84.163])
	by mail.openembedded.org (Postfix) with ESMTP id 4FDB273170
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 10:50:11 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zoho; d=geekcentral.pub; 
	h=date:from:to:cc:message-id:in-reply-to:references:subject:mime-version:content-type:user-agent;
	b=QwfnPnIJaysdzS9n28dD5Au5Vn8euLCI4fOkv+/oITedDyVFVLudWwa51ksTp4qj7YyECCAmUGiG
	Qb8aTmyfKmTNyF/ZCpHrRrT858a/+Q9fFcaTLrHBNLpYHpr1vDD54YTUrt3d1XaA1Avsk1d65K8c
	B/klfFnIG+l+M7u+4Eo=  
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1461927011051837.1657742171058;
	Fri, 29 Apr 2016 03:50:11 -0700 (PDT)
Date: Fri, 29 Apr 2016 06:50:10 -0400
From: Ian Geiser <geiseri@geekcentral.pub>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Message-ID: <15461a3e2b1.db27b2f76194.3175716769885720576@geekcentral.pub>
In-Reply-To: <1461917940.5465.74.camel@linuxfoundation.org>
References: <1461871306-2466-1-git-send-email-geiseri@geekcentral.pub>
	<1461917940.5465.74.camel@linuxfoundation.org>
MIME-Version: 1.0
X-Priority: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: "<openembedded-core@lists.openembedded.org>"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Allow different filesystems to be used for VM images.
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
X-List-Received-Date: Fri, 29 Apr 2016 10:50:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


 ---- On Fri, 29 Apr 2016 04:19:00 -0400 Richard Purdie <richard.purdie@linuxfoundation.org> wrote ---- 
 > On Thu, 2016-04-28 at 15:21 -0400, Ian Reinhart Geiser wrote: 
 > > This allows for things like btrfs to be used vs just ext4. 
 > > The default value of ext4 is kept so there is no functional 
 > > change unless ROOTFS_TYPE is set in the inherting recipe. 
 > >  
 > > Signed-off-by: Ian Reinhart Geiser <geiseri@geekcentral.pub> 
 > > --- 
 > >  meta/classes/image-vm.bbclass | 13 +++++++------ 
 > >  1 file changed, 7 insertions(+), 6 deletions(-) 
 >  
 >  
 > This seems reasonable but could I ask you to use a variable name with 
 > "VM" in the name please? 
 >  
 > I appreciate some of the existing ones don't do this but moving forward 
 > we need to try and better namespace some of these class specific 
 > variables and this seems like a good place to start. 
 >  
 > VM_ROOTFS_TYPE would be better for example (or VMIMG_ROOTFS_TYPE). 
 >  
The other ones have foo_VM in the name.  Would ROOTFS_TYPE_VM be acceptable?

 > Cheers, 
 >  
 > Richard 
 >  
 > > diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image 
 > > -vm.bbclass 
 > > index 47f7326..50d93d5 100644 
 > > --- a/meta/classes/image-vm.bbclass 
 > > +++ b/meta/classes/image-vm.bbclass 
 > > @@ -23,16 +23,17 @@ do_bootdirectdisk[depends] += "dosfstools 
 > > -native:do_populate_sysroot \ 
 > >                                 syslinux-native:do_populate_sysroot \ 
 > >                                 parted-native:do_populate_sysroot \ 
 > >                                 mtools-native:do_populate_sysroot \ 
 > > -                               ${PN}:do_image_ext4 \ 
 > > +                               ${PN}:do_image_${ROOTFS_TYPE} \ 
 > >                                 " 
 > >   
 > > -IMAGE_TYPEDEP_vmdk = "ext4" 
 > > -IMAGE_TYPEDEP_vdi = "ext4" 
 > > -IMAGE_TYPEDEP_qcow2 = "ext4" 
 > > -IMAGE_TYPEDEP_hdddirect = "ext4" 
 > > +IMAGE_TYPEDEP_vmdk = "${ROOTFS_TYPE}" 
 > > +IMAGE_TYPEDEP_vdi = "${ROOTFS_TYPE}" 
 > > +IMAGE_TYPEDEP_qcow2 = "${ROOTFS_TYPE}" 
 > > +IMAGE_TYPEDEP_hdddirect = "${ROOTFS_TYPE}" 
 > >  IMAGE_TYPES_MASKED += "vmdk vdi qcow2 hdddirect" 
 > >   
 > > -ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.ext4" 
 > > +ROOTFS_TYPE ?= "ext4" 
 > > +ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.${ROOTFS_TYPE}" 
 > >   
 > >  # Used by bootloader 
 > >  LABELS_VM ?= "boot" 
 > > --  
 > > 2.8.0.rc3 
 > >  
 > >  
 > 


