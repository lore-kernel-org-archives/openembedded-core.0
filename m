Return-Path: <geiseri@geekcentral.pub>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
	[74.201.84.163])
	by mail.openembedded.org (Postfix) with ESMTP id 9C88760125
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 11:55:14 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zoho; d=geekcentral.pub; 
	h=date:from:to:cc:message-id:in-reply-to:references:subject:mime-version:content-type:user-agent;
	b=RwpiGyE+KV2IxLHic/xKhu0V2WHWL8I5JB/Yh6bnEhwDWhmVdFeUznOKZqfMEjWhPITs5OF4mHat
	IJEjBsc+AZyHsMotaZQfi8XkOuSkvpCKjK2/arR/Ure217qSMBsftiTTgLY2KoI1zlZsJc/lWAup
	xIjbQC4OeW4uZnURo2g=  
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1462276512330169.63448196354614;
	Tue, 3 May 2016 04:55:12 -0700 (PDT)
Date: Tue, 03 May 2016 07:55:12 -0400
From: Ian Geiser <geiseri@geekcentral.pub>
To: "Ian Reinhart Geiser" <geiseri@geekcentral.pub>
Message-ID: <1547678da14.11ea2eb8718367.335561670221363303@geekcentral.pub>
In-Reply-To: <1461933709-22049-1-git-send-email-geiseri@geekcentral.pub>
References: <1461933709-22049-1-git-send-email-geiseri@geekcentral.pub>
MIME-Version: 1.0
X-Priority: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-ZohoMail: Z_60737559 SPT_1 Z_60732476 SPT_1 SLF_D
X-Zoho-Virus-Status: 2
Cc: "<openembedded-core@lists.openembedded.org>"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] Allow different filesystems to be used for VM images.
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
X-List-Received-Date: Tue, 03 May 2016 11:55:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


What is the status of this patch?

 ---- On Fri, 29 Apr 2016 08:41:49 -0400 Ian Reinhart Geiser <geiseri@geekcentral.pub> wrote ---- 
 > This allows for things like btrfs to be used vs just ext4. 
 > The default value of ext4 is kept so there is no functional 
 > change unless VM_ROOTFS_TYPE is set in the inherting recipe. 
 >  
 > Signed-off-by: Ian Reinhart Geiser <geiseri@geekcentral.pub> 
 > --- 
 >  meta/classes/image-vm.bbclass | 13 +++++++------ 
 >  1 file changed, 7 insertions(+), 6 deletions(-) 
 >  
 > diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass 
 > index 47f7326..2bbd9d3 100644 
 > --- a/meta/classes/image-vm.bbclass 
 > +++ b/meta/classes/image-vm.bbclass 
 > @@ -23,16 +23,17 @@ do_bootdirectdisk[depends] += "dosfstools-native:do_populate_sysroot \ 
 >                                 syslinux-native:do_populate_sysroot \ 
 >                                 parted-native:do_populate_sysroot \ 
 >                                 mtools-native:do_populate_sysroot \ 
 > -                               ${PN}:do_image_ext4 \ 
 > +                               ${PN}:do_image_${VM_ROOTFS_TYPE} \ 
 >                                 " 
 >   
 > -IMAGE_TYPEDEP_vmdk = "ext4" 
 > -IMAGE_TYPEDEP_vdi = "ext4" 
 > -IMAGE_TYPEDEP_qcow2 = "ext4" 
 > -IMAGE_TYPEDEP_hdddirect = "ext4" 
 > +IMAGE_TYPEDEP_vmdk = "${VM_ROOTFS_TYPE}" 
 > +IMAGE_TYPEDEP_vdi = "${VM_ROOTFS_TYPE}" 
 > +IMAGE_TYPEDEP_qcow2 = "${VM_ROOTFS_TYPE}" 
 > +IMAGE_TYPEDEP_hdddirect = "${VM_ROOTFS_TYPE}" 
 >  IMAGE_TYPES_MASKED += "vmdk vdi qcow2 hdddirect" 
 >   
 > -ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.ext4" 
 > +VM_ROOTFS_TYPE ?= "ext4" 
 > +ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.${VM_ROOTFS_TYPE}" 
 >   
 >  # Used by bootloader 
 >  LABELS_VM ?= "boot" 
 > --  
 > 2.8.1 
 >  
 > 


