Received: from mail-vc0-f173.google.com ([209.85.220.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UAIb0-0003yW-QO
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 12:21:19 +0100
Received: by mail-vc0-f173.google.com with SMTP id fy27so2409390vcb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 03:04:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=tc4/FFb5ZKMCfC/XOgCdbeGhkS3ctNAGDWYstcFlKTY=;
	b=cX8kcr8XsXGoqQQeiWJGFfSUIk0qV8tspaGcuQ58ib10Z/BF2FNnhCpvU7jRkwsCvg
	rCcaDNqzo+dDndLyIq89JsO57DJvtWkVX516uSlFATtPaMlHlV4clucgO7bR/kPGarCN
	gZelEvY/7cttw8W2XNKrbQVUhHT2Vge5CjBVUWaMagbR50jjIfJ6LgxAXZf7YQnb3kaR
	MflR4wceGm1YJFtU2vYbJp51bNIn/f+MHDt5PJ8LdNXMbYHsl3LGEn8sGs3aV9IYJ4xT
	QYSVjTi1ALqq2AXFIAfR2dnrp8eu2dCNyfOlVt5vkKtFtU+E3hq82yeT+keNfriHPCrq
	Lcrw==
X-Received: by 10.59.4.101 with SMTP id cd5mr2308137ved.14.1361876699480; Tue,
	26 Feb 2013 03:04:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.77.105 with HTTP; Tue, 26 Feb 2013 03:04:39 -0800 (PST)
In-Reply-To: <cdf763e0896938a5189aa1694b6769f5b6d7190b.1361783630.git.Qi.Chen@windriver.com>
References: <cover.1361783630.git.Qi.Chen@windriver.com>
	<cdf763e0896938a5189aa1694b6769f5b6d7190b.1361783630.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Feb 2013 11:04:39 +0000
Message-ID: <CAJTo0LbKDQNM2V02fsqBCG_RrBc517yGwVSBLi5nSnwFvs-_bw@mail.gmail.com>
To: Qi.Chen@windriver.com
X-Gm-Message-State: ALoCoQkm9ls3P0I2wUnVSNfFwB4LhFePGWXYpucYjeAcObHHSpBNw4dn0vn0IC9Es7WGrKiH14Xh
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sysvinit: start .sh scripts correctly
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
X-List-Received-Date: Tue, 26 Feb 2013 11:21:21 -0000
Content-Type: text/plain; charset=UTF-8

On 26 February 2013 01:39,  <Qi.Chen@windriver.com> wrote:
> -
> -  case "$1" in
> -       *.sh)
> -               # Source shell script for speed.
> -               (
> -                       trap - INT QUIT TSTP
> -                       scriptname=$1
> -                       shift
> -                       . $scriptname
> -               )
> -               ;;
> -       *)
> -               "$@"
> -               ;;
> -  esac
> +  "$@"
>    startup_progress
>  }

NACK.

By "fix" you mean "remove the tested and proven optimisation"? The "if
.sh use ." test was designed to speed up booting by not forking a new
bash, and it's been demonstrated to have a noticeable difference on
slower hardware.

You can pass arguments to "." as this little test demonstrates:

$ cat service.sh
echo My arguments are "$@"
$ . service.sh foo bar
My arguments are foo bar

The "shift" command shows that passing the arguments to the script was
the intention, and a few lines of micro-test demonstrate that it
*should* work:

$ cat rc.sh
startup() {
    scriptname=$1
    shift
    . $scriptname
}
startup ./service.sh start
$ busybox sh ./rc.sh
My arguments are start

So, something else is going wrong.

Ross


