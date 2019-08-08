Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3D6377F2F5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 16:45:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x78Gjpc5008737
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Aug 2019 09:45:51 -0700 (PDT)
Received: from [192.168.10.15] (172.25.59.219) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 8 Aug 2019 09:45:50 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
References: <20190808125509.120784-1-jason.wessel@windriver.com>
Message-ID: <e3ea6d0a-082a-f848-986f-8f53c8cb743b@windriver.com>
Date: Thu, 8 Aug 2019 11:45:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190808125509.120784-1-jason.wessel@windriver.com>
Subject: Re: [PATCH 1/4] image_types_wic.bbclass: Copy the .wks and .env files to deploy image dir
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
X-List-Received-Date: Thu, 08 Aug 2019 16:45:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/8/19 7:55 AM, Jason Wessel wrote:
> When using a .wks.in file, the only place that the generated .wks file
> exists in the tmp/work area.  A copy should be left behind in the
> deploy directory so that you can easily run the wic tool to
> re-generate or modify a new image without running bitbake.  Custom
> .wks.in files can reference any number of bitbake variables, so it is
> important to save the result.
> 
> below is an example of using the generated .wks file in the deploy
> area.  The full name of my generated .wks file was
> core-image-minimal-ostree-uboot-ab.wks, but since you usually only
> have a single .wks file per image you can use a wild card like:
> 
>    cd tmp*/deploy/images/*
>    wic create --vars . -e core-image-minimal -s -m core-image-minimal-*.wks
> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>   meta/classes/image_types_wic.bbclass | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
> index 519aeb1b04..ce94138b3c 100644
> --- a/meta/classes/image_types_wic.bbclass
> +++ b/meta/classes/image_types_wic.bbclass
> @@ -77,6 +77,11 @@ python do_write_wks_template () {
>       wks_file = d.getVar('WKS_FULL_PATH')
>       with open(wks_file, 'w') as f:
>           f.write(template_body)
> +    f.close()
> +    # Copy the finalized wks file to the deploy directory for later use
> +    depdir = d.getVar('DEPLOY_DIR_IMAGE')

This needs a call to "bb.utils.mkdirhier(depdir)" in order to work properly.

I didn't find the problem until using a higher degree of parallelism where the deploy directory might not actually be there to write out the file.  I'll send a v2 after more tests with the rest of the series.  It was all well tested originally on a single server, extended testing found the problem.


Cheers,
Jason.

> +    basename = d.getVar('IMAGE_BASENAME')
> +    bb.utils.copyfile(wks_file, "%s/%s" % (depdir, basename + '-' + os.path.basename(wks_file)))
>   }
>   
>   python () {
> @@ -127,6 +132,10 @@ python do_rootfs_wicenv () {
>               value = d.getVar(var)
>               if value:
>                   envf.write('%s="%s"\n' % (var, value.strip()))
> +    envf.close()
> +    # Copy to deploy directory for later use with stand alone wic
> +    depdir = d.getVar('DEPLOY_DIR_IMAGE')
> +    bb.utils.copyfile(os.path.join(outdir, basename) + '.env', os.path.join(depdir, basename) + '.env')
>   }
>   addtask do_rootfs_wicenv after do_image before do_image_wic
>   do_rootfs_wicenv[vardeps] += "${WICVARS}"
> 


