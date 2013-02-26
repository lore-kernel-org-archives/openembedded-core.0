Received: from mail-oa0-f54.google.com ([209.85.219.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UAQxk-0000Kl-9E
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 21:17:23 +0100
Received: by mail-oa0-f54.google.com with SMTP id n12so6122095oag.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 12:00:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:message-id:subject:from:to:cc:date:in-reply-to
	:references:content-type:x-mailer:mime-version
	:content-transfer-encoding:x-gm-message-state;
	bh=z3JrzhHvSKsK0GtJAlLRVfuAwT3oXO0VtwNApURC40w=;
	b=IfKF5RibQq6vGS0MF5CkBsWbVdNj1WuTdfJkRJkPUelMBDx0HgARojcPb4zCrtffJs
	Xmpbq5nc9eJmvGng/gLsNoRbBvVIH02QExA4og4KgP7JM0UaxxdaNEe4cTsbcQlfnedC
	BtQYTScC+3JYfkpnFwx4Vx8W1ynuNVm679DW/F3F91WE//Rr8Pe8mPDfjBMpT29VoFnN
	gPXQlZaKBpBGHuQyX9QC9W44sRM9TNLT+e8Uj+WXNNzbCyKw9j/HZvaArH28xXwjz67b
	meq2cw8I/oRTiFZ8MI+/5I0maNuGciwpC53+X/my3MJVzy2o3/SNH0z+ZYqSaJ9cdvB5
	N/Ww==
X-Received: by 10.182.40.71 with SMTP id v7mr12367692obk.85.1361908850629;
	Tue, 26 Feb 2013 12:00:50 -0800 (PST)
Received: from [10.0.1.95] (adsl-68-88-197-100.dsl.rcsntx.swbell.net.
	[68.88.197.100])
	by mx.google.com with ESMTPS id p2sm3156827obb.6.2013.02.26.12.00.46
	(version=SSLv3 cipher=RC4-SHA bits=128/128);
	Tue, 26 Feb 2013 12:00:50 -0800 (PST)
Message-ID: <1361908840.1685.5.camel@rrMBP>
From: Koen Kooi <koen@dominion.thruhere.net>
To: Ross Burton <ross.burton@intel.com>
Date: Tue, 26 Feb 2013 21:00:40 +0100
In-Reply-To: <1361901233-23197-1-git-send-email-ross.burton@intel.com>
References: <1361901233-23197-1-git-send-email-ross.burton@intel.com>
X-Mailer: Evolution 3.6.3 (3.6.3-2.fc18) 
Mime-Version: 1.0
X-Gm-Message-State: ALoCoQlWu/CKn0TXWs6IZQYi73oDJ82Sb0V8Z/yI8wmmZPuStjATKtOL/diDpyW7tebN+y11ffLJ
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] systemd: set the location of the kill binary
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2013 20:17:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-02-26 at 17:53 +0000, Ross Burton wrote:
> Otherwise systemd uses AC_PROG_PATH and finds it in the sysroot, which won't
> work on the target.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-core/systemd/systemd_197.bb |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
> index c765c18..001d111 100644
> --- a/meta/recipes-core/systemd/systemd_197.bb
> +++ b/meta/recipes-core/systemd/systemd_197.bb
> @@ -63,6 +63,7 @@ EXTRA_OECONF = " --with-rootprefix=${base_prefix} \
>                   --disable-microhttpd \
>                   --without-python \
>                   --with-sysvrcnd-path=${sysconfdir} \
> +                 ac_cv_path_KILL=/bin/kill \

Like V1 this hardcodes ${base_bindir} to /bin, this breaks when your
DISTRO sets $base_prefix to /usr. So please change that to:

	ac_cv_path+KILL=${base_bindir}/kill



