Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0DB1173CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Sep 2015 22:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8BMWW7k026846; Fri, 11 Sep 2015 23:32:32 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id FqzBuAvfJp49; Fri, 11 Sep 2015 23:32:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8BMWI70026840
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 11 Sep 2015 23:32:30 +0100
Message-ID: <1442010738.24871.458.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: benjamin.esquivel@linux.intel.com
Date: Fri, 11 Sep 2015 23:32:18 +0100
In-Reply-To: <1441992374.14702.12.camel@linux.intel.com>
References: <1440626255-29614-1-git-send-email-alejandro.franco@linux.intel.com>
	<1440626255-29614-4-git-send-email-alejandro.franco@linux.intel.com>
	<1441992374.14702.12.camel@linux.intel.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] Empty image: filesystem allocation
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
X-List-Received-Date: Fri, 11 Sep 2015 22:32:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-09-11 at 12:26 -0500, Benjamin Esquivel wrote:
> Hi Alejandro,
> 
> On Wed, 2015-08-26 at 16:57 -0500, Alex Franco wrote:
> > Increase sparse image block size when ROOTFS_SIZE is smaller than
> > the minimum needed for ext4 to fit into it.
> > 
> > [YOCTO #7664]
> > 
> > Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
> > ---
> >  meta/classes/image_types.bbclass | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes/image_types.bbclass
> > b/meta/classes/image_types.bbclass
> > index 35ceb7b..61ce222 100644
> > --- a/meta/classes/image_types.bbclass
> > +++ b/meta/classes/image_types.bbclass
> > @@ -49,8 +49,16 @@ oe_mkext234fs () {
> >  		extra_imagecmd=$@
> >  	fi
> >  
> > +	# If generating an empty image the size of the sparse block
> > should be large
> > +	# enough to allocate an ext4 filesystem using 4096 bytes per
> > inode, this is
> > +	# about 60K, so dd needs a minimum count of 60, with bs=1024
> > (bytes per IO)
> > +	eval local COUNT=\"0\"
> > +	eval local MIN_COUNT=\"60\"
> > +	if [ $ROOTFS_SIZE -lt $MIN_COUNT ]; then
> > +		eval COUNT=\"$MIN_COUNT\"
> > +	fi
> >  	# Create a sparse image block
> > -	dd if=/dev/zero
> > of=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.$fstype seek=$ROOTFS_SIZE
> > count=0 bs=1k
> > +	dd if=/dev/zero
> > of=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.$fstype seek=$ROOTFS_SIZE
> > count=$COUNT bs=1024
> Variable references enclosed in {} are less prone to misinterpretation.

They are however more likely to get expanded by bitbake before you'd
expect them to be unfortunately :(

Cheers,

Richard


> >  	mkfs.$fstype -F $extra_imagecmd
> > ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.$fstype -d ${IMAGE_ROOTFS}
> >  }
> >  
> > -- 
> > 2.5.0
> > 



