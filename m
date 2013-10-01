Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E39546007B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2013 15:52:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r91FqwAL026226
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Oct 2013 08:52:58 -0700 (PDT)
Received: from msp-dhcp16.wrs.com (172.25.34.16) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 1 Oct 2013 08:52:58 -0700
Message-ID: <524AEFDB.4010804@windriver.com>
Date: Tue, 1 Oct 2013 10:52:59 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1380642011-14346-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1380642011-14346-1-git-send-email-sgw@linux.intel.com>
Subject: Re: [PATCH] image.bbclass: ensure makedevs does return true
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
X-List-Received-Date: Tue, 01 Oct 2013 15:52:58 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/1/13 10:40 AM, Saul Wold wrote:
> When doing an incremental image generation, ensure that makedevs returns true when it encounters
> a node that already exists, otherwise image generation will fail.
>
> [YOCTO #5288]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   meta/classes/image.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 7650594..463fa71 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -337,7 +337,7 @@ fakeroot do_rootfs () {
>   		for devtable in ${@get_devtable_list(d)}; do
>   			# Always return ture since there maybe already one when use the
>   			# incremental image generation
> -			makedevs -r ${IMAGE_ROOTFS} -D $devtable
> +			makedevs -r ${IMAGE_ROOTFS} -D $devtable || true

I'm a little worried about this patch.  There is a known case where makedevs 
will fail with a message indicating it can't do the name -> uid/gid 
translations.  In this case it just stops, and the nodes are never generated.

The underlying cause is that the passwd/group files never got installed onto the 
target.  Adding a specific check for this might be a good idea, but doing the || 
true will cause errors like that to be masked.

Perhaps finding a way to patch makedevs to no error when a node already exists?

--Mark

>   		done
>   	fi
>
>


