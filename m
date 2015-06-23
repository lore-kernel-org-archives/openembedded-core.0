Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 89926601E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 11:22:49 +0000 (UTC)
Received: (qmail 25754 invoked by uid 1003); 23 Jun 2015 11:22:50 -0000
Received: from unknown (HELO ?192.168.11.121?)
	(philip@opensdr.com@108.44.110.39)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	23 Jun 2015 11:22:50 -0000
Message-ID: <55894189.50102@balister.org>
Date: Tue, 23 Jun 2015 07:22:49 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Ed Bartosh <ed.bartosh@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1435053182-8028-1-git-send-email-ed.bartosh@linux.intel.com>
	<1435053182-8028-5-git-send-email-ed.bartosh@linux.intel.com>
In-Reply-To: <1435053182-8028-5-git-send-email-ed.bartosh@linux.intel.com>
Subject: Re: [wic][PATCH 4/6] wic: Implement image compressing
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
X-List-Received-Date: Tue, 23 Jun 2015 11:22:51 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Can you add a way to enable multiple threads for xz? I found this helps
speed up file creation.

Philip

On 06/23/2015 05:53 AM, Ed Bartosh wrote:
> Implemented compressing result image with specified compressor.
> Updated reporting code to show compressed image.
> 
> [YOCTO #7593]
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> 
> diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
> index f3f20e0..2ea7e4e 100644
> --- a/scripts/lib/wic/imager/direct.py
> +++ b/scripts/lib/wic/imager/direct.py
> @@ -33,6 +33,7 @@ from wic.utils.partitionedfs import Image
>  from wic.utils.errors import CreatorError, ImageError
>  from wic.imager.baseimager import BaseImageCreator
>  from wic.plugin import pluginmgr
> +from wic.utils.oe.misc import exec_cmd
>  
>  disk_methods = {
>      "do_install_disk":None,
> @@ -71,6 +72,7 @@ class DirectImageCreator(BaseImageCreator):
>          self.bootimg_dir = bootimg_dir
>          self.kernel_dir = kernel_dir
>          self.native_sysroot = native_sysroot
> +        self.compressor = compressor
>  
>      def __get_part_num(self, num, parts):
>          """calculate the real partition number, accounting for partitions not
> @@ -318,6 +320,13 @@ class DirectImageCreator(BaseImageCreator):
>                                                          self.bootimg_dir,
>                                                          self.kernel_dir,
>                                                          self.native_sysroot)
> +        # Compress the image
> +        if self.compressor:
> +            for disk_name, disk in self.__image.disks.items():
> +                full_path = self._full_path(self.__imgdir, disk_name, "direct")
> +                msger.debug("Compressing disk %s with %s" % \
> +                            (disk_name, self.compressor))
> +                exec_cmd("%s %s" % (self.compressor, full_path))
>  
>      def print_outimage_info(self):
>          """
> @@ -328,7 +337,11 @@ class DirectImageCreator(BaseImageCreator):
>          parts = self._get_parts()
>  
>          for disk_name, disk in self.__image.disks.items():
> -            full_path = self._full_path(self.__imgdir, disk_name, "direct")
> +            extension = "direct" + {"gzip": ".gz",
> +                                    "bzip2": ".bz2",
> +                                    "xz": ".xz",
> +                                    "": ""}.get(self.compressor)
> +            full_path = self._full_path(self.__imgdir, disk_name, extension)
>              msg += '  %s\n\n' % full_path
>  
>          msg += 'The following build artifacts were used to create the image(s):\n'
> 

