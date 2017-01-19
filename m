Return-Path: <armccurdy@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 61DB071C7A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 19:02:17 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id q89so6451882lfi.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 11:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RYXs3BUUGPAwp1Z7sPq0FrWqAMWCl0VI9LhLh2pGapo=;
	b=hS4+3Q8nQxCsGeL89mp9z9csozMtjAG0nxEhCxdgx0/nUdLXiAxMw66hxLe4e+WBOp
	uOugbjSzEDfE3ZMup1iDBmSrJW9/6ag9UqkJualoAw77iy4BVIkWzFbf2s6bypkuPFOE
	tkx/0SAbn71DZXE4MukaUzP2cQwxUl1OpJgyUCbjpUV+tyxqiJ0TtJNqvybXWXnVVnuw
	RV0ts1s9nNFBVbKkuZej/18siUxFRTruzXw9Mlmp9xb6m1guCHQvfeno8h2GDJ+FRMZQ
	sLtVK/Ve5RCWl8ynHjc96bEIsZntOnsHKrXXjHfm3lFvtVF6F60SNdYNEw4XmWRRmdGe
	mxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RYXs3BUUGPAwp1Z7sPq0FrWqAMWCl0VI9LhLh2pGapo=;
	b=ntBn1zA+bbTzH9QUaOvMpsv1oV+HKUnIi/ByTBNXg3Fvi3fYVGrDi2ggWhMJbG9ujq
	8JD8ln0OZVCNHYY9hrLWKQzsSaX6VTA1bAwYiuQrcX5P70slR7AuGmXmNMle26FYLHuH
	bNtx2uj2cLztOaobuLZSov+d/CYL8NW/kFWjQMts0z/y5l9hETd2PztQ2SGwEsJCxO4w
	h2W5XqYpOsxyrx/N5rwJPXedzq9aRQNJPJH9XkiscHpT3PQi/sKy8kU7XRNYXodgjXUj
	EPUZhyPL+osfsqKNRH727eZ/52UlV7gTBVcqHDN/5Plfl3WSJWpUweY4xzTxGeShXWQ3
	uklA==
X-Gm-Message-State: AIkVDXIYh+orKrn6JitffYh7zcc992eWMijZnunRBFpF89TLxS/+KDeD8zUAvtWKsLQvCEn9Aj05HtV+ifvgxA==
X-Received: by 10.223.149.39 with SMTP id 36mr1676041wrs.125.1484852537846;
	Thu, 19 Jan 2017 11:02:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.248.129 with HTTP; Thu, 19 Jan 2017 11:02:17 -0800 (PST)
In-Reply-To: <1484838091-13265-1-git-send-email-yannick.gicquel@iot.bzh>
References: <1484838091-13265-1-git-send-email-yannick.gicquel@iot.bzh>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 19 Jan 2017 11:02:17 -0800
Message-ID: <CAJ86T=W=moB9EoX+7dby4qCFM7+5+3Y7j_3=jSxAiUunHc1PpQ@mail.gmail.com>
To: Yannick Gicquel <yannick.gicquel@iot.bzh>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] ccache.bbclass: enable max size setup for ccache dir
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
X-List-Received-Date: Thu, 19 Jan 2017 19:02:19 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 19, 2017 at 7:01 AM, Yannick Gicquel
<yannick.gicquel@iot.bzh> wrote:
> ccache directories are limited to 1G by default.

1G has been the default for a long time, so maybe it's time to propose
an upstream change to increase, e.g. to 10G, giving the size of the
webkitgtk build as justification?

Since we build ccache-native within oe-core, any such patch could be
applied to our version of ccache right now (ie we don't need to wait
for it to be accepted and merged upstream).

> This patch enables the configuration of their limits, and as default
> location is TMPDIR, it proposes a size limit to "0" (unlimited).
>
> The setup can be overloaded in local.conf by setting
> CCACHE_MAX_SIZE to a custom value if needed.
>
> Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
> ---
>  meta/classes/ccache.bbclass | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
> index 93fcaca..b6643a1 100644
> --- a/meta/classes/ccache.bbclass
> +++ b/meta/classes/ccache.bbclass
> @@ -1,6 +1,14 @@
>  CCACHE = "${@bb.utils.which(d.getVar('PATH'), 'ccache') and 'ccache '}"
>  export CCACHE_DIR ?= "${TMPDIR}/ccache/${MULTIMACH_HOST_SYS}/${PN}"
>  CCACHE_DISABLE[unexport] = "1"
> +CCACHE_MAX_SIZE ?= "0"
>
>  do_configure[dirs] =+ "${CCACHE_DIR}"
>  do_kernel_configme[dirs] =+ "${CCACHE_DIR}"
> +
> +ccache_init() {
> +    if [ -n "${CCACHE}" ]; then
> +        ${CCACHE} -M ${CCACHE_MAX_SIZE}
> +    fi
> +}
> +do_configure[postfuncs] += "ccache_init"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

