Return-Path: <mario.goulart@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 441C960809
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 20:51:16 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id z60so1075261qgd.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Dec 2014 12:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type;
	bh=WzLhMByOxFOCrC8TdB1X/bE9mCqcdmanGRBk84fKkyo=;
	b=SxeFeSsD2+7SWedYDZDFmD65PQQ36h/2YJLvpfLAcC60Zqvmt1Xst+WvCenzSyzvTo
	LCSEFWvG+5QN5FzvJzJ97mdhJLO1d8vx9XPuCdu2tmXMyZ8WOCFoTaW39J9iUMUZLprs
	oXZIm5mvLGb9j4oYL+xC5jBMFKROUpGVCqzfozsiW1MEmow6jUwoOCGWWaySCb7wVcPo
	imiZnwWJhHHFvJ/0CIyrrplNXC8IiCrlRpUJR37Hase4Hq7fXaZA9/b3lFD/x5fbvM2M
	O89mdgaOt85mhCFb5CB65o1pTf46vTdY8oKf7jkX7raRQhtSkqALqDwpvUNO5jHLIDVz
	e4jA==
X-Received: by 10.229.215.137 with SMTP id he9mr1102924qcb.6.1418158276792;
	Tue, 09 Dec 2014 12:51:16 -0800 (PST)
Received: from email.parenteses.org.gmail.com (email.parenteses.org.
	[198.199.72.94])
	by mx.google.com with ESMTPSA id c3sm2160871qaa.14.2014.12.09.12.51.15
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Dec 2014 12:51:15 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1418156688-1564-1-git-send-email-otavio@ossystems.com.br>
	<1418156688-1564-2-git-send-email-otavio@ossystems.com.br>
Date: Tue, 09 Dec 2014 20:51:12 +0000
In-Reply-To: <1418156688-1564-2-git-send-email-otavio@ossystems.com.br>
	(Otavio Salvador's message of "Tue, 9 Dec 2014 18:24:48 -0200")
Message-ID: <87d27s35tr.fsf@email.parenteses.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] lib/oe/image.py: Handle compressed IMAGE_TYPEDEP values
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
X-List-Received-Date: Tue, 09 Dec 2014 20:51:24 -0000
Content-Type: text/plain

On Tue,  9 Dec 2014 18:24:48 -0200 Otavio Salvador <otavio@ossystems.com.br> wrote:

> When computing the dependency graph for the image generation, we need
> to take into account the compression type and identify the base type
> it relates to. This allow for a more robust graph generation even when
> using composed image types.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/lib/oe/image.py | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
> index 7e080b0..9ac7d3d 100644
> --- a/meta/lib/oe/image.py
> +++ b/meta/lib/oe/image.py
> @@ -48,6 +48,7 @@ class ImageDepGraph(object):
>          graph = dict()
>  
>          def add_node(node):
> +            node = self._image_base_type(node)
>              deps = (self.d.getVar('IMAGE_TYPEDEP_' + node, True) or "")
>              if deps != "":
>                  graph[node] = deps
> @@ -72,6 +73,18 @@ class ImageDepGraph(object):
>          for item in remove_list:
>              self.graph.pop(item, None)
>  
> +    def _image_base_type(self, type):
> +        ctypes = self.d.getVar('COMPRESSIONTYPES', True).split()
> +        if type == "vmdk" or type == "live" or type == "iso" or type == "hddimg":

This could be shorter as

   if type in ["vmdk", "live", "iso", "hddimg" ]

> +            type = "ext3"
> +        basetype = type
> +        for ctype in ctypes:
> +            if type.endswith("." + ctype):
> +                basetype = type[:-len("." + ctype)]
> +                break
> +
> +        return basetype
> +
>      def _compute_dependencies(self):
>          """
>          returns dict object of nodes with [no_of_depends_on, no_of_depended_by]
> -- 
> 2.1.3

Best wishes.
Mario
-- 
http://www.ossystems.com.br

