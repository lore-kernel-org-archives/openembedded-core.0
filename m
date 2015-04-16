Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 1C862605D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 10:31:16 +0000 (UTC)
Received: by wgso17 with SMTP id o17so75858271wgs.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 03:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=VvZ9cD2ZvXW1efKvZ/PDLbpDsvwkLqX1S1LMJcpyr+I=;
	b=jUg8HxoTnVeoKAmE0Qk5sS8VwdPVSUne0twvyxjrhN46iOhnEdww1VbntVjW/+kngu
	wLfz/5+wsWDllW4YcEWSYlf7Ap+WXkQUr2AfRyTZ9ZBrYib30QA8cefeK+kVIsvBxBDt
	o8iMAz8Fh6mb8xT6LZEdBGikIrOq/yxED8/Hnhxedg9xVkj9LyM5Bri0XUFa2seGldGv
	w7AfNGynvCDA0TWEkZkKhV+5lEc5mNJ10yboCS1r+CbI2oO2TKrc6EJ9+nexJl0R6ABK
	mF6x6kbEc8dtPJ6iyK/xSTTwxyl9NtnL72qcCgZpW1vZuJ0HOxShqVnNSuMFdURiLexK
	sJpw==
X-Received: by 10.180.188.193 with SMTP id gc1mr3849036wic.7.1429180277730;
	Thu, 16 Apr 2015 03:31:17 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id hl8sm9778633wjb.38.2015.04.16.03.31.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Apr 2015 03:31:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 16 Apr 2015 12:31:33 +0200
To: Chen Qi <Qi.Chen@windriver.com>
Message-ID: <20150416103133.GA2341@jama>
References: <cover.1429170493.git.Qi.Chen@windriver.com>
	<c1c7339199e08085ed82ffed0d80356d5b177807.1429170493.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <c1c7339199e08085ed82ffed0d80356d5b177807.1429170493.git.Qi.Chen@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] layer_extra_sanity.bbclass: add new bbclass
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
X-List-Received-Date: Thu, 16 Apr 2015 10:31:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2015 at 03:49:19PM +0800, Chen Qi wrote:
> Add a new bbclass for extra sanity check for layers.
>=20
> These sanity checks include:
> *) conf/machine and conf/distro don't appear in the same layer.
>    The rational is that distro specific changes and BSP specific changes
>    should be splitted into different layers for better maintenance.
>    The meta layer is an exception.
> *) A BSP layer is not included if MACHINE is not set to any of the conf f=
ile
>    it provides.
>    The rational is that BSP layer, by design, is supposed to make changes
>    specific for the BSPs it covers. Including a BSP layer which doesn't c=
ontain
>    a conf file matching the MACHINE setting might cause potential problem.

This is exactly the opposite of what the manual says.

BSP layer should be written in a way that it has no unwelcome
side-effects for other MACHINES (by proper usage of MACHINE overrides).

> *) Configuration files under conf/machine don't set distro specific varia=
bles
>    such as DISTRO_FEATURES.
>    The rational is that machine configuration files should not set things
>    related to machine.
>=20
> [YOCTO #5427]
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/layer_extra_sanity.bbclass | 91 +++++++++++++++++++++++++++=
++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 meta/classes/layer_extra_sanity.bbclass
>=20
> diff --git a/meta/classes/layer_extra_sanity.bbclass b/meta/classes/layer=
_extra_sanity.bbclass
> new file mode 100644
> index 0000000..17671c3
> --- /dev/null
> +++ b/meta/classes/layer_extra_sanity.bbclass
> @@ -0,0 +1,91 @@
> +# Check conf/distro and conf/machine don't appear in the same layer
> +def check_machine_distro_dir(sanity_data):
> +    bblayers =3D sanity_data.getVar('BBLAYERS', True).split()
> +    for bblayer in bblayers:
> +        bblayer =3D bblayer.rstrip('/')
> +        # skip checking of the meta layer, it's special
> +        if bblayer.endswith('meta'):
> +            continue
> +        if os.path.exists(bblayer + '/' + 'conf/machine') and os.path.ex=
ists(bblayer + '/' + 'conf/distro'):
> +            bb.warn("Layer %s is providing both distro configurations an=
d machine configurations. It's recommended that a layer should provide at m=
ost one of them." % bblayer)
> +
> +# Check that distro variables such as DISTRO_FEATURES are not being set =
in machine conf files
> +def check_distro_vars_machine(sanity_data):
> +    import re
> +
> +    bblayers =3D sanity_data.getVar('BBLAYERS', True).split()
> +    distro_regex =3D re.compile("^DISTRO_.*=3D.*")
> +    distro_var_match =3D False
> +
> +    for bblayer in bblayers:
> +        bblayer =3D bblayer.rstrip('/')
> +        if bblayer.endswith('meta'):
> +            continue
> +        # Check .inc and .conf files under machine/conf don't set DISTRO=
_xxx vars
> +        for dirpath, dirnames, filenames in os.walk('%s/conf/machine' % =
bblayer):
> +            for f in filenames:
> +                fpath =3D os.path.join(dirpath, f)
> +                if fpath.endswith(".inc") or fpath.endswith(".conf"):
> +                    with open(fpath) as fopen:
> +                        for line in fopen:
> +                            if distro_regex.match(line):
> +                                distro_var_match =3D True
> +                                break
> +                if distro_var_match:
> +                    break
> +            if distro_var_match:
> +                break
> +        if distro_var_match:
> +            bb.warn("Layer %s is setting distro specific variables in it=
s machine conf files." % bblayer)
> +        distro_var_match =3D False
> +
> +# Check that a disto/bsp layer is being included but MACHINE or DISTRO i=
s not set to any conf
> +# file that it provides.
> +#
> +# The rational here is that if a BSP layer is supposed to have recipes o=
r bbappend files that
> +# are only specific for the BSPs it provides. So if MACHINE is not set t=
o any of the
> +# conf/machine/*.conf file in that layer, very likely the user is accide=
ntly including a BSP layer.
> +# The same logic goes for distro layers.
> +def check_unneedded_bsp_distro_layer(sanity_data):
> +    machine =3D sanity_data.getVar('MACHINE', True)
> +    distro =3D sanity_data.getVar('DISTRO', True)
> +    bblayers =3D sanity_data.getVar('BBLAYERS', True).split()
> +
> +    for bblayer in bblayers:
> +        bblayer =3D bblayer.rstrip('/')
> +        if bblayer.endswith('meta'):
> +            continue
> +        is_bsp =3D os.path.exists(bblayer + '/' + 'conf/machine')
> +        is_distro =3D os.path.exists(bblayer + '/' + 'conf/distro')
> +        if is_bsp and not is_distro:
> +            if not os.path.exists(bblayer + '/' + 'conf/machine/' + mach=
ine + '.conf'):
> +                bb.warn("BSP layer %s is included but MACHINE is not set=
 to any conf file it provides." % bblayer)
> +        elif not is_bsp and is_distro:
> +           if not os.path.exists(bblayer + '/' + 'conf/distro/' + distro=
 + '.conf'):
> +                bb.warn("Distro layer %s is included but DISTRO is not s=
et to any conf file it provides." % bblayer)
> +
> +# Create a copy of the datastore and finalise it to ensure appends and=
=20
> +# overrides are set - the datastore has yet to be finalised at ConfigPar=
sed
> +def copy_data(e):
> +    sanity_data =3D bb.data.createCopy(e.data)
> +    sanity_data.finalize()
> +    return sanity_data
> +
> +def layer_extra_check_sanity(sanity_data):
> +    check_machine_distro_dir(sanity_data)
> +    check_unneedded_bsp_distro_layer(sanity_data)
> +    check_distro_vars_machine(sanity_data)
> +
> +addhandler check_layer_extra_sanity_eventhandler
> +check_layer_extra_sanity_eventhandler[eventmask] =3D "bb.event.SanityChe=
ck"
> +python check_layer_extra_sanity_eventhandler() {
> +    if bb.event.getName(e) =3D=3D "SanityCheck":
> +        sanity_data =3D copy_data(e)
> +        if e.generateevents:
> +            sanity_data.setVar("SANITY_USE_EVENTS", "1")
> +        layer_extra_check_sanity(sanity_data)
> +        e.data.setVar("BB_INVALIDCONF", False)
> +        bb.event.fire(bb.event.SanityCheckPassed(), e.data)
> +
> +    return
> +}
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

