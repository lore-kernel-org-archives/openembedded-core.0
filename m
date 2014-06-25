Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BE06460E24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 09:40:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5P9empY027559
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Jun 2014 02:40:48 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 25 Jun 2014 02:40:48 -0700
Message-ID: <53AA991D.5000505@windriver.com>
Date: Wed, 25 Jun 2014 17:40:45 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Himanshu Pandey <pandey_himanshu80@rediffmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1403356395.S.2910.26443.H.TlJvYmVydCBZYW5nAFJlOiBbYml0YmFrZS1kZXZlbF0gSGk_.RU.rfs303,
	rfs303, 637,
	244.f4-235-248.old.replied.1403688235.2532@webmail.rediffmail.com>
In-Reply-To: <1403356395.S.2910.26443.H.TlJvYmVydCBZYW5nAFJlOiBbYml0YmFrZS1kZXZlbF0gSGk_.RU.rfs303,
	rfs303, 637,
	244.f4-235-248.old.replied.1403688235.2532@webmail.rediffmail.com>
Subject: Re: [bitbake-devel] Hi
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
X-List-Received-Date: Wed, 25 Jun 2014 09:40:48 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


I think that you can add this to the image's recipe, or to conf/local.conf:

do_rootfs[postfuncs] += "<your script>"

Or you can add a task:

add task <your task> after do_rootfs before do_build

Please refer insane.bbclass or other classes in meta/classes for more info.

// Robert

On 06/25/2014 05:23 PM, Himanshu Pandey wrote:
> Hi,
>
> Script in this section is appending just after the COMPRESS_CMD_bz2 command
> and the full script is executing as a single command.
>
> I want to run my script separately just after rootfs.tar.bz2 is created.
> Please help.
>
> Thanks in advance
>
> From: Robert Yang <liezhi.yang@windriver.com>
> Sent: Sat, 21 Jun 2014 18:43:15
> To: Himanshu Pandey <pandey_himanshu80@rediffmail.com>, Patches and discussions
> about the oe-core layer <openembedded-core@lists.openembedded.org>
> Subject: Re: [bitbake-devel] Hi
>
> Hello,
>
> I think that this email should go into oe-core mailing list (see
> the CC). You can refer to:
>
> oe-core/meta/classes/image_types.bbclass:
>
> IMAGE_CMD_tar = "tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar -C
> ${IMAGE_ROOTFS} ."
> COMPRESS_CMD_bz2 = "bzip2 -f -k ${IMAGE_NAME}.rootfs.${type}"
>
> I think that you can add something like the following to your recipe:
>
> COMPRESS_CMD_bz2_append () {
>     <your shell script>
> }
>
> Then the script would run after the .tar.bz2 is created.
>
> // Robert
>
> On 06/21/2014 08:26 PM, Himanshu Pandey wrote:
>  > Hi,
>  >
>  > I have a requirement that once the .tar.bz2 is created I want my shell script to
>  > be executed finally.
>  >
>  > So where do I have to add this?
>  >
>  > So what I have to do in order to achieve this.
>  >
>  > Regards,
>  > Himanshu Pandey
>  >
>  >
> <http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?>
>  > Get your own *FREE* website, *FREE* domain & *FREE* mobile app with Company
> email.
>  >    *Know More >*
>  >
> <http://track.rediff.com/click?url=___http://businessemail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=sign-1-10-13___&cmp=host&lnk=sign-1-10-13&nsrv1=host>
>  >
>  >
>  >
>
> <http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?>
> Get your own *FREE* website, *FREE* domain & *FREE* mobile app with Company email.
> 	*Know More >*
> <http://track.rediff.com/click?url=___http://businessemail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=sign-1-10-13___&cmp=host&lnk=sign-1-10-13&nsrv1=host>
>

