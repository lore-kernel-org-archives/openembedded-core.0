Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6178F74901
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 08:05:05 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id y189-v6so2699042wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 01:05:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2kSPpLuMOTLFBYh9frHRWxoq+uBaEFIIGlaBdVLBu5g=;
	b=c940N57tuZI9xoPGhrS9zGdL+vOrSsDTa9qopUUE+Gdobxfe4rcblao0n38Vhz/Fhl
	ntkLmnvO6w+qDWoZD83JdPhblpnhCloy4yvyfcjeF0ZsQU7zy1QqHLUXWAOTP+K95TBV
	TP+sirAxMa/OiQV9up7NwqmfvHCu84iMCUJZ6QsuQODTghwFXESGQNH2JM6fADWyr/e4
	5oW/mvVXoMi7GeXzVSzjaslAz9x0XnD2INPw+XFtpVi4IdjabM+xwl9OvNVh5IN1GpgV
	DoHPOZfmNekbRdPJAkiMzW74qex98rCU6Ql6X3DSeSbShMhe69I4WBvpnms5e6gwaOYt
	+8HA==
X-Gm-Message-State: ALKqPwekBAw0h6uOPOoB/IoLApbeOCBoabFfHCdM3uLwg0IyIv9mBtDk
	Jmp/YyErT1ShAj0MOKfhX6a66o3o
X-Google-Smtp-Source: AB8JxZqXqoLO4vX1RqoVrg0cYEv/qlcbPC2LRopR0Z6NakwGLdz7dD9+fo8b41xLpKlbSQV3mwdkKg==
X-Received: by 2002:a50:9953:: with SMTP id
	l19-v6mr965959edb.179.1525939506533; 
	Thu, 10 May 2018 01:05:06 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	z11-v6sm319583edh.60.2018.05.10.01.05.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 10 May 2018 01:05:05 -0700 (PDT)
Message-ID: <1525939504.5115.18.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 May 2018 09:05:04 +0100
In-Reply-To: <20180321163130.23765-1-git@andred.net>
References: <20180309130000.1937-1-git@andred.net>
	<20180321163130.23765-1-git@andred.net>
X-Mailer: Evolution 3.26.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH v2] rootfs-postcommands: put image testdata under sstate control
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
X-List-Received-Date: Thu, 10 May 2018 08:05:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

ping

On Wed, 2018-03-21 at 16:31 +0000, André Draszik wrote:
> From: André Draszik <andre.draszik@jci.com>
> 
> The testdata.json is being written to DEPLOY_DIR_IMAGE directly,
> thus bypassing sstate, which results in an ever growing list
> of files.
> 
> Write them to IMGDEPLOYDIR instead, so as to benefit from the
> automatic management via sstate.
> 
> Signed-off-by: André Draszik <andre.draszik@jci.com>
> 
> ---
> v2: fix typo in subject line
> ---
>  meta/classes/rootfs-postcommands.bbclass | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/meta/classes/rootfs-postcommands.bbclass
> b/meta/classes/rootfs-postcommands.bbclass
> index a4e627fef8..01eee350b8 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -303,17 +303,18 @@ rootfs_sysroot_relativelinks () {
>  python write_image_test_data() {
>      from oe.data import export2json
>  
> -    testdata = "%s/%s.testdata.json" % (d.getVar('DEPLOY_DIR_IMAGE'),
> d.getVar('IMAGE_NAME'))
> -    testdata_link = "%s/%s.testdata.json" %
> (d.getVar('DEPLOY_DIR_IMAGE'), d.getVar('IMAGE_LINK_NAME'))
> +    deploy_dir = d.getVar('IMGDEPLOYDIR')
> +    link_name = d.getVar('IMAGE_LINK_NAME')
> +    testdata_name = os.path.join(deploy_dir, "%s.testdata.json" %
> d.getVar('IMAGE_NAME'))
>  
> -    bb.utils.mkdirhier(os.path.dirname(testdata))
>      searchString = "%s/"%(d.getVar("TOPDIR")).replace("//","/")
> -    export2json(d, testdata,searchString=searchString,replaceString="")
> +    export2json(d, testdata_name, searchString=searchString,
> replaceString="")
>  
> -    if testdata_link != testdata:
> +    if os.path.exists(testdata_name):
> +        testdata_link = os.path.join(deploy_dir, "%s.testdata.json" %
> link_name)
>          if os.path.lexists(testdata_link):
> -           os.remove(testdata_link)
> -        os.symlink(os.path.basename(testdata), testdata_link)
> +            os.remove(testdata_link)
> +        os.symlink(os.path.basename(testdata_name), testdata_link)
>  }
>  write_image_test_data[vardepsexclude] += "TOPDIR"
>  

