Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 637366B2B9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 09:07:09 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s53974pW011173; Tue, 3 Jun 2014 10:07:04 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wB195qXd8HTj; Tue,  3 Jun 2014 10:07:04 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5396xJ1011148
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 3 Jun 2014 10:07:01 +0100
Message-ID: <1401786411.12440.54.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>
Date: Tue, 03 Jun 2014 10:06:51 +0100
In-Reply-To: <cd4a352b664c2c15c0ad9ff7bc4e5870f2e0c941.1401781206.git.Qi.Chen@windriver.com>
References: <cover.1401781206.git.Qi.Chen@windriver.com>
	<cd4a352b664c2c15c0ad9ff7bc4e5870f2e0c941.1401781206.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: matt.cowell@nsn.com, openembedded-core@lists.openembedded.org
Subject: Re: [daisy][PATCH 1/1] systemd: do not use alloca() function in case of uclibc
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
X-List-Received-Date: Tue, 03 Jun 2014 09:07:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-06-03 at 15:42 +0800, Chen Qi wrote:
> The alloca() function allocates space in the stack frame of the caller,
> so using alloca(new_size - old_size) would possibly crash the stack,
> causing a segment fault error.
> 
> This patch fixes the above problem by avoiding using this function in
> journal-file.c.
> 
> [YOCTO #6201]
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../0001-journal-file.c-do-not-use-alloca.patch    |   54 ++++++++++++++++++++
>  meta/recipes-core/systemd/systemd_211.bb           |    1 +
>  2 files changed, 55 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-journal-file.c-do-not-use-alloca.patch
> 
> diff --git a/meta/recipes-core/systemd/systemd/0001-journal-file.c-do-not-use-alloca.patch b/meta/recipes-core/systemd/systemd/0001-journal-file.c-do-not-use-alloca.patch
> new file mode 100644
> index 0000000..a638d58
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0001-journal-file.c-do-not-use-alloca.patch
> @@ -0,0 +1,54 @@
> +Upstream-Status: Inappropriate [oe specific]

From the description, this sounds like an allocation error which can
happen *anywhere* and is a problem that should be addressed upstream.

This Upstream-Status field is therefore completely bogus. Its not
inappropriate or oe specific. If you still believe it is, I'd like to
hear more explanation.

The abuses of this field are starting to really annoy me since this
keeps happening.

Cheers,

Richard




