Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B015C47DDF
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 10:57:21 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.13095.1706266639141499617
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 02:57:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hydMlRec;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40e86a9fc4bso3753965e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 02:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706266637; x=1706871437; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0RK7Wm2XpV6zlH262gQXw27OG518WdouZ5tWvbl+M1U=;
        b=hydMlRecQHKESa3BofEk0rrD+bgNMiXvsx84ZDTHK/i2Q38Z54OE4HMaPHrPxgrkiq
         pSaWLiorqUyIMTcHm05yVVV3Ru9zbewB1sHFhGvcNBdoz+gv3JcdxuO1OLgi13sDeJA8
         jhKd4AvWM4S38DGKKb6c5b6VmVwfZESwo/g9LKDzEa0Ng6JxoNIdnRfnnasyWa6xMsll
         FoH0dOG37DlXkINdpJhDls4jsutPtUfbii5499IryHzvPCoEbb98OpxVJhJPg0cAwdet
         lLg6OQ5jsYhJyRiz4nVBf9moTvQk7qygCh6FnXSIf+H1ohD78ZrJR1kMLLQjeoOJIhur
         FE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706266637; x=1706871437;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0RK7Wm2XpV6zlH262gQXw27OG518WdouZ5tWvbl+M1U=;
        b=wqJ5jhADvSImXzqKzbQKq1ugzZo79ATOQEqIZKhBr1iICDWVbxFkOqYQkrCSpee+fl
         NR4D109yfiR6S4EG356zh04zmbL33Ppq/7t3//UpouQDMG/HiUigemkEIpIjefu22GIY
         CeSJVyG/XD5W7Hmbr4H5dJdMHdHSWSOHr7AwpwVEa1miEvj49QlLnZG6fdSZnwE0QJSJ
         EjO++p20wJt76j/OgLqeOQfD0zqfw2eJbfceNkWQLZd50bk7y5AuzANMaU5aZ9D7I4XR
         ZrU/ucJoxWjs0A5xMsJFCDyrAoFy5H3/LvRyhNyL8+RdrC9sfpPex2gqI+4JhoIkjRQx
         d3Cg==
X-Gm-Message-State: AOJu0YwmrKxoBZhnoH5XAQxh0iXXllR206Q1c9SGje3lD25/Xv57bLv+
	SzY/NO9jStX28uO2DXsJFhWzlcEFhvyhphMqWpbRfgbz05l98PCeoMy4jnKNGk1otp8lkPqwiue
	RAKRJ+51wtD2GObrm2i1J/f0gfhpGwbHiX5k=
X-Google-Smtp-Source: AGHT+IH8kUWR9LmvebKk8QotPXLtHiAGKCbTPeY04qwLOhQhBqf9owxmuDmK+ErQAyvwCa2g5KhzF4ry6Cz9cfmeJ4A=
X-Received: by 2002:a05:600c:3d8a:b0:40e:3fa2:a16 with SMTP id
 bi10-20020a05600c3d8a00b0040e3fa20a16mr699817wmb.201.1706266637117; Fri, 26
 Jan 2024 02:57:17 -0800 (PST)
MIME-Version: 1.0
References: <4ed80c78-5940-454d-b4a7-a820f04f0f08@gmail.com> <CA+chaQfrEKrfFDEKt3__x1pg2SPApqU60e8RWOYHPOvmUDGcpg@mail.gmail.com>
In-Reply-To: <CA+chaQfrEKrfFDEKt3__x1pg2SPApqU60e8RWOYHPOvmUDGcpg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 26 Jan 2024 11:57:04 +0100
Message-ID: <CA+chaQev=e2XatLHfufKOUpgWc29tka0gURj9CB5mirXXsTsdA@mail.gmail.com>
Subject: Re: [OE-core] bb.utils.vercmp_string_op() vs Python 3.12
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cc340e060fd728fa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 10:57:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194350

--000000000000cc340e060fd728fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

See
https://git.openembedded.org/meta-openembedded/commit/?h=3Dkirkstone&id=3D8=
a042b540db5421785edcf21d5114be6358246fd

On Fri, Jan 26, 2024 at 11:53=E2=80=AFAM Martin Jansa <martin.jansa@gmail.c=
om>
wrote:

> > I copied vercmp_string_op() and all others called by it from
> bitbake/lib/bb/utils.py into a new python script.
>
> It's not an issue in vercmp_string_op itself, but the version value it
> gets from waf --version isn't just the version itself but also
> SyntaxWarning from waf.
>
> So you need to update waf in jack not to trigger SyntaxWarning when waf
> --version is called.
>
> On Fri, Jan 26, 2024 at 10:17=E2=80=AFAM Zoltan Boszormenyi <zboszor@gmai=
l.com>
> wrote:
>
>> Hi,
>>
>> Just a FYI.
>>
>> After the bitbake-server getting stuck after bitbake exited
>> with Python 3.12 issue was fixed, here's another one.
>>
>> This time it's semi-reliably triggered by the jack recipe
>> in meta-openembedded:
>>
>> ERROR: jack-1.19.22-r0 do_configure: Error executing a python function i=
n
>> exec_func_python() autogenerated:
>>
>> The stack trace of python calls that resulted in this exception/failure
>> was:
>> File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
>>       0001:
>>   *** 0002:waf_preconfigure(d)
>>       0003:
>> File:
>> '/home/zozo/test-yocto-4.3-gh/conf/../layers/openembedded-core/meta/clas=
ses-recipe/waf.bbclass',
>>
>> lineno: 58, function: waf_preconfigure
>>       0054:    wafbin =3D os.path.join(subsrcdir, 'waf')
>>       0055:    try:
>>       0056:        result =3D subprocess.check_output([python, wafbin,
>> '--version'],
>> cwd=3Dsubsrcdir, stderr=3Dsubprocess.STDOUT)
>>       0057:        version =3D result.decode('utf-8').split()[1]
>>   *** 0058:        if bb.utils.vercmp_string_op(version, "1.8.7", ">=3D"=
):
>>       0059:            d.setVar("WAF_EXTRA_CONF", "--bindir=3D${bindir}
>> --libdir=3D${libdir}")
>>       0060:    except subprocess.CalledProcessError as e:
>>       0061:        bb.warn("Unable to execute waf --version, exit code
>> %d. Assuming waf
>> version without bindir/libdir support." % e.returncode)
>>       0062:    except FileNotFoundError:
>> File: '/home/zozo/test-yocto-4.3-gh/bitbake/lib/bb/utils.py', lineno:
>> 150, function:
>> vercmp_string_op
>>       0146:    Compare two versions and check if the specified compariso=
n
>> operator matches
>> the result of the comparison.
>>       0147:    This function is fairly liberal about what operators it
>> will accept since
>> there are a variety of styles
>>       0148:    depending on the context.
>>       0149:    """
>>   *** 0150:    res =3D vercmp_string(a, b)
>>       0151:    if op in ('=3D', '=3D=3D'):
>>       0152:        return res =3D=3D 0
>>       0153:    elif op =3D=3D '<=3D':
>>       0154:        return res <=3D 0
>> File: '/home/zozo/test-yocto-4.3-gh/bitbake/lib/bb/utils.py', lineno:
>> 140, function:
>> vercmp_string
>>       0136:    return r
>>       0137:
>>       0138:def vercmp_string(a, b):
>>       0139:    """ Split version strings and compare them """
>>   *** 0140:    ta =3D split_version(a)
>>       0141:    tb =3D split_version(b)
>>       0142:    return vercmp(ta, tb)
>>       0143:
>>       0144:def vercmp_string_op(a, b, op):
>> File: '/home/zozo/test-yocto-4.3-gh/bitbake/lib/bb/utils.py', lineno: 91=
,
>> function:
>> split_version
>>       0087:    """Split a version string into its constituent parts (PE,
>> PV, PR)"""
>>       0088:    s =3D s.strip(" <>=3D")
>>       0089:    e =3D 0
>>       0090:    if s.count(':'):
>>   *** 0091:        e =3D int(s.split(":")[0])
>>       0092:        s =3D s.split(":")[1]
>>       0093:    r =3D ""
>>       0094:    if s.count('-'):
>>       0095:        r =3D s.rsplit("-", 1)[1]
>> Exception: ValueError: invalid literal for int() with base 10:
>> 'SyntaxWarning'
>>
>> ERROR: Logfile of failure stored in:
>>
>> /home/zozo/test-yocto-4.3-gh/tmp-sicom-glibc/work/corei7-64-oe-linux/jac=
k/1.19.22/temp/log.do_configure.1709417
>>
>> "Semi-reliably", i.e. about 50-50 or 60-40 percent failure vs success
>> rate.
>> Usually the second run succeeds after a failure.
>>
>> I copied vercmp_string_op() and all others called by it
>> from bitbake/lib/bb/utils.py into a new python script as a
>> minimum test case. Running this script inside a locally
>> cloned jack git repository has 100% success rate.
>>
>> It looks like an internal Python "flake" issue.
>>
>> Best regards,
>> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#194348):
>> https://lists.openembedded.org/g/openembedded-core/message/194348
>> Mute This Topic: https://lists.openembedded.org/mt/103973063/3617156
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> martin.jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--000000000000cc340e060fd728fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">See<div><a href=3D"https://git.openembedded.org/meta-opene=
mbedded/commit/?h=3Dkirkstone&amp;id=3D8a042b540db5421785edcf21d5114be63582=
46fd">https://git.openembedded.org/meta-openembedded/commit/?h=3Dkirkstone&=
amp;id=3D8a042b540db5421785edcf21d5114be6358246fd</a><br></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan =
26, 2024 at 11:53=E2=80=AFAM Martin Jansa &lt;<a href=3D"mailto:martin.jans=
a@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">&gt; I copied=C2=A0verc=
mp_string_op() and all others called by it from bitbake/lib/bb/utils.py int=
o a new python script.<div><br></div><div>It&#39;s not an issue in vercmp_s=
tring_op itself, but the version value it gets from waf --version isn&#39;t=
 just the version itself but also SyntaxWarning from waf.</div><div><br></d=
iv><div>So you need to update waf in jack not to trigger SyntaxWarning when=
 waf --version is called.</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Fri, Jan 26, 2024 at 10:17=E2=80=AFAM Zol=
tan Boszormenyi &lt;<a href=3D"mailto:zboszor@gmail.com" target=3D"_blank">=
zboszor@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Hi,<br>
<br>
Just a FYI.<br>
<br>
After the bitbake-server getting stuck after bitbake exited<br>
with Python 3.12 issue was fixed, here&#39;s another one.<br>
<br>
This time it&#39;s semi-reliably triggered by the jack recipe<br>
in meta-openembedded:<br>
<br>
ERROR: jack-1.19.22-r0 do_configure: Error executing a python function in <=
br>
exec_func_python() autogenerated:<br>
<br>
The stack trace of python calls that resulted in this exception/failure was=
:<br>
File: &#39;exec_func_python() autogenerated&#39;, lineno: 2, function: &lt;=
module&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0001:<br>
=C2=A0=C2=A0*** 0002:waf_preconfigure(d)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0003:<br>
File: <br>
&#39;/home/zozo/test-yocto-4.3-gh/conf/../layers/openembedded-core/meta/cla=
sses-recipe/waf.bbclass&#39;, <br>
lineno: 58, function: waf_preconfigure<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0054:=C2=A0=C2=A0=C2=A0 wafbin =3D os.path.j=
oin(subsrcdir, &#39;waf&#39;)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0055:=C2=A0=C2=A0=C2=A0 try:<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0056:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 result =3D subprocess.check_output([python, wafbin, &#39;--version&#39;=
], <br>
cwd=3Dsubsrcdir, stderr=3Dsubprocess.STDOUT)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0057:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 version =3D result.decode(&#39;utf-8&#39;).split()[1]<br>
=C2=A0=C2=A0*** 0058:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if bb.utils=
.vercmp_string_op(version, &quot;1.8.7&quot;, &quot;&gt;=3D&quot;):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0059:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar(&quot;WAF_EXTRA_CONF&quot;, &quot;--bi=
ndir=3D${bindir} --libdir=3D${libdir}&quot;)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0060:=C2=A0=C2=A0=C2=A0 except subprocess.Ca=
lledProcessError as e:<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0061:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 bb.warn(&quot;Unable to execute waf --version, exit code %d. Assuming w=
af <br>
version without bindir/libdir support.&quot; % e.returncode)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0062:=C2=A0=C2=A0=C2=A0 except FileNotFoundE=
rror:<br>
File: &#39;/home/zozo/test-yocto-4.3-gh/bitbake/lib/bb/utils.py&#39;, linen=
o: 150, function: <br>
vercmp_string_op<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0146:=C2=A0=C2=A0=C2=A0 Compare two versions=
 and check if the specified comparison operator matches <br>
the result of the comparison.<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0147:=C2=A0=C2=A0=C2=A0 This function is fai=
rly liberal about what operators it will accept since <br>
there are a variety of styles<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0148:=C2=A0=C2=A0=C2=A0 depending on the con=
text.<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0149:=C2=A0=C2=A0=C2=A0 &quot;&quot;&quot;<b=
r>
=C2=A0=C2=A0*** 0150:=C2=A0=C2=A0=C2=A0 res =3D vercmp_string(a, b)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0151:=C2=A0=C2=A0=C2=A0 if op in (&#39;=3D&#=
39;, &#39;=3D=3D&#39;):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0152:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return res =3D=3D 0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0153:=C2=A0=C2=A0=C2=A0 elif op =3D=3D &#39;=
&lt;=3D&#39;:<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0154:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return res &lt;=3D 0<br>
File: &#39;/home/zozo/test-yocto-4.3-gh/bitbake/lib/bb/utils.py&#39;, linen=
o: 140, function: <br>
vercmp_string<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0136:=C2=A0=C2=A0=C2=A0 return r<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0137:<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0138:def vercmp_string(a, b):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0139:=C2=A0=C2=A0=C2=A0 &quot;&quot;&quot; S=
plit version strings and compare them &quot;&quot;&quot;<br>
=C2=A0=C2=A0*** 0140:=C2=A0=C2=A0=C2=A0 ta =3D split_version(a)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0141:=C2=A0=C2=A0=C2=A0 tb =3D split_version=
(b)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0142:=C2=A0=C2=A0=C2=A0 return vercmp(ta, tb=
)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0143:<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0144:def vercmp_string_op(a, b, op):<br>
File: &#39;/home/zozo/test-yocto-4.3-gh/bitbake/lib/bb/utils.py&#39;, linen=
o: 91, function: <br>
split_version<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0087:=C2=A0=C2=A0=C2=A0 &quot;&quot;&quot;Sp=
lit a version string into its constituent parts (PE, PV, PR)&quot;&quot;&qu=
ot;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0088:=C2=A0=C2=A0=C2=A0 s =3D s.strip(&quot;=
 &lt;&gt;=3D&quot;)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0089:=C2=A0=C2=A0=C2=A0 e =3D 0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0090:=C2=A0=C2=A0=C2=A0 if s.count(&#39;:&#3=
9;):<br>
=C2=A0=C2=A0*** 0091:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 e =3D int(s=
.split(&quot;:&quot;)[0])<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0092:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 s =3D s.split(&quot;:&quot;)[1]<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0093:=C2=A0=C2=A0=C2=A0 r =3D &quot;&quot;<b=
r>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0094:=C2=A0=C2=A0=C2=A0 if s.count(&#39;-&#3=
9;):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0095:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 r =3D s.rsplit(&quot;-&quot;, 1)[1]<br>
Exception: ValueError: invalid literal for int() with base 10: &#39;SyntaxW=
arning&#39;<br>
<br>
ERROR: Logfile of failure stored in: <br>
/home/zozo/test-yocto-4.3-gh/tmp-sicom-glibc/work/corei7-64-oe-linux/jack/1=
.19.22/temp/log.do_configure.1709417<br>
<br>
&quot;Semi-reliably&quot;, i.e. about 50-50 or 60-40 percent failure vs suc=
cess rate.<br>
Usually the second run succeeds after a failure.<br>
<br>
I copied=C2=A0vercmp_string_op() and all others called by it<br>
from bitbake/lib/bb/utils.py into a new python script as a<br>
minimum test case. Running this script inside a locally<br>
cloned jack git repository has 100% success rate.<br>
<br>
It looks like an internal Python &quot;flake&quot; issue.<br>
<br>
Best regards,<br>
Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#194348): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/194348" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/194348</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103973063/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103973063/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div>

--000000000000cc340e060fd728fa--

