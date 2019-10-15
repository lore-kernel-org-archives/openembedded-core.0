Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9E48F79C7C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 13:18:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x9FDJ0FZ026188
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 06:19:00 -0700
Received: from [128.224.56.208] (128.224.56.208) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 15 Oct 2019 06:18:59 -0700
To: Robert Yang <liezhi.yang@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1571129436.git.liezhi.yang@windriver.com>
	<f25dc9d8cf72566819e6bf3b55ee987ca80adb3e.1571129436.git.liezhi.yang@windriver.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <03d2e12e-c62c-a1c0-a07d-10ae456da270@windriver.com>
Date: Tue, 15 Oct 2019 09:18:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f25dc9d8cf72566819e6bf3b55ee987ca80adb3e.1571129436.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/1] weston: Fix PACKAGECONFIG for remoting
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
X-List-Received-Date: Tue, 15 Oct 2019 13:19:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 10/15/19 4:51 AM, Robert Yang wrote:

> Fix a typo: gstreamer-1.0 -> gstreamer1.0.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/recipes-graphics/wayland/weston_7.0.0.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/wayland/weston_7.0.0.bb b/meta/recipes-graphics/wayland/weston_7.0.0.bb
> index d212754..02d724a 100644
> --- a/meta/recipes-graphics/wayland/weston_7.0.0.bb
> +++ b/meta/recipes-graphics/wayland/weston_7.0.0.bb
> @@ -64,7 +64,7 @@ PACKAGECONFIG[colord] = "-Dcolor-management-colord=true,-Dcolor-management-color
>   # Clients support
>   PACKAGECONFIG[clients] = "-Dsimple-clients=all -Ddemo-clients=true,-Dsimple-clients= -Ddemo-clients=false"
>   # Virtual remote output with GStreamer on DRM backend
> -PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false,gstreamer-1.0"
> +PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false,gstreamer1.0"
>   # Weston with PAM support
>   PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam"
>   

You'll need to add gstreamer1.0-plugins-base as well if it is going to 
successfully build, i.e. the line should be

PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false,gstreamer1.0 gstreamer1.0-plugins-base"

Otherwise, you'll run into do_package_qa errors.


