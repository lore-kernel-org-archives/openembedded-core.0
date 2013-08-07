Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by mail.openembedded.org (Postfix) with ESMTP id E8A9C61013
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2013 20:29:06 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id n12so4124427oag.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Aug 2013 13:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=CPBlI0tjgRCTbB8SmFHE3tjgRWK6sh1ZaqVtMg1NCa0=;
	b=vIwE2HH6Fl0G4gxPINHyYeqIH/15rjvQu05japF468JUh3uZxjSwot+PqdWK5TuTfC
	1FoxJ89K5FNImEU7lf6CxkAhfNqlzcylqiNF6CKW/7KuHQhVMPDisJjB3ScP5x9KSZTM
	s9O+Gu+bSs8XbWZ50SxQsTsdcEgy3VPUVxDApQwbZuYDof0VfXM7Z4Gi9rVyFYYTVxJZ
	ehwZ8aZccPvBOJsivhi49di3WTRNSSmZHv3sRbT+TprlvT1oSJG2vKJywxnlM23H4X1u
	I/c/ADV9QMECwQwa9bFyDIgeceF+w24WlqeghKdChd3jXsRhXkx+pKjkGb3rpxLd0XyV
	0YNQ==
MIME-Version: 1.0
X-Received: by 10.60.96.169 with SMTP id dt9mr1943013oeb.27.1375907347178;
	Wed, 07 Aug 2013 13:29:07 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 7 Aug 2013 13:29:07 -0700 (PDT)
In-Reply-To: <9a4e60262e656b8e3138805c74b8f5ed3bf40fbe.1375862591.git.Qi.Chen@windriver.com>
References: <cover.1375862591.git.Qi.Chen@windriver.com>
	<9a4e60262e656b8e3138805c74b8f5ed3bf40fbe.1375862591.git.Qi.Chen@windriver.com>
Date: Wed, 7 Aug 2013 17:29:07 -0300
X-Google-Sender-Auth: 9HMMVWqGLFTxfyf9QuMFSEAkGfc
Message-ID: <CAP9ODKpyS3L0H6HpRwouVmesHXr8Yk3AW48s2_xCZhkKMF8iJQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Christopher Larson <clarson@kergoth.com>, chen_q07@163.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V4 02/10] use a uniform way to determine whether rootfs is read-only
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
X-List-Received-Date: Wed, 07 Aug 2013 20:29:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 7, 2013 at 5:08 AM,  <Qi.Chen@windriver.com> wrote:
...
> --- a/meta/recipes-core/initscripts/initscripts-1.0/functions
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/functions
> @@ -58,3 +58,17 @@ status() {
>      fi
>      return 3
>  }
> +
> +# Determine whether rootfs is read-only or not according to /proc/mounts or /etc/fstab.
> +is_rootfs_readonly () {
> +    local DIRNAME=`dirname $0`
> +    local ROOT_DIR=`echo $DIRNAME | sed -ne 's:/etc/.*::p'`
> +    local criteria_file
> +    [ -n "$ROOT_DIR" ] && criteria_file="$ROOT_DIR/etc/fstab" || criteria_file="/proc/mounts"
> +    local flag
> +    for flag in `awk '{ if ($2 == "/") { split($4,FLAGS,",") } }; END { for (f in FLAGS) print FLAGS[f] }' < $criteria_file`; do
> +       [ "$flag" = "ro" ] && { echo "yes"; return 0; }
> +    done
> +    echo "no"
> +    return 0
> +}
> \ No newline at end of file

Please fix this.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

