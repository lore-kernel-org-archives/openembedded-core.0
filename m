Return-Path: <yann.dirson@blade-group.com>
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
	[209.85.167.175])
	by mail.openembedded.org (Postfix) with ESMTP id 480A57BD9A
	for <openembedded-core@openembedded.org>;
	Sun, 19 Jan 2020 23:00:01 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id k4so27075843oik.2
	for <openembedded-core@openembedded.org>;
	Sun, 19 Jan 2020 15:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=blade-group.com; s=google;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=SvVFy0PlFHJ+hdVB7xQC1QH+649bZHFGXFZIckKLvyo=;
	b=PStqSBP4if/y6Ja2JkMqOuTToMXM5UxVQnaaQ8dXrYuBWUuf+HgkZI/Tu4UH3wwh09
	prXmoEJa7xOOrz9JxxBsJ6WEeHDXNjtZaz53BAwfsjiiGOHtXrMq4iKbhCGWoSTMlZ9s
	me73qVTrmD1q1QORSc+2WuMHL8WVZ/pl0sWwNm+6t79TiRg16PebF3qLs4lmYmLS5R2a
	qpJ1woWLmlxz6ToEzPpp0dH7LYJr/JorwR2cD9LQxVKanpasKSLY6IzWi32zUhPJ2cbn
	+yPMQbrfa4OyTzSYvQwHL+I1sXKyhDO6sar5gr+QUa4Iul8PDvfJtWBOaK09n2TWIekY
	w9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=SvVFy0PlFHJ+hdVB7xQC1QH+649bZHFGXFZIckKLvyo=;
	b=U0IcfIluRQrRQOTZOWIyK42mo7MP0a9QVJYSmZT7P5vZY0gWNxRLUhfTfWnDu4K2St
	tS4cUwUdQj7I1DOustNPZqW4w4GwfWoSUpR6bHE9JHBwF2g11gz/2rh8sm8KE9QAOLxn
	XYOLn0dEGWH4akk0zC77kfWBedje9aND2JHej1ypdQWDkVHStjs6EckN2Wp6Unxcmckd
	4y00EbwhfbIXrY5KytjMsUEnsbUcJLo8aEl552CK1By+UplBEP6t/iP0YnP3xKQHhi1F
	Z2BbtPTGVVAIXYCvwUFSGjXeF4mo26sQpZnlm711pSUT48mmdw3KPSDhai26OH7czbYF
	Mvqg==
X-Gm-Message-State: APjAAAVk+AXPFh2mKnEdXLBTe5DH1uMXRgc0uijuAUIArlvoxCeB7TCi
	AVsJwOmzH1NsVT1lKBepFde6RdWbd9q3yhLmScJYJA==
X-Google-Smtp-Source: APXvYqw9gEgGiw0qbtfDxf5UO20E+bh2r6qiLG/hV0rRkH53OOb6YQKFxfETzhBkrrSpBdWxojHh/PTg7olh4v9MoNU=
X-Received: by 2002:aca:4d58:: with SMTP id a85mr10756473oib.35.1579474801976; 
	Sun, 19 Jan 2020 15:00:01 -0800 (PST)
MIME-Version: 1.0
From: Yann Dirson <yann.dirson@blade-group.com>
Date: Sun, 19 Jan 2020 23:59:51 +0100
Message-ID: <CA+4=imbzpDitOKi0_cuF4CyzMdzh-ht9HUYkrM8PbTZAc9FvgQ@mail.gmail.com>
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Cc: openembedded-core@openembedded.org
Subject: libsolv giving opkg wrong hint about dependency issue
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
X-List-Received-Date: Sun, 19 Jan 2020 23:00:02 -0000
Content-Type: multipart/alternative; boundary="00000000000081185e059c8622a2"

--00000000000081185e059c8622a2
Content-Type: text/plain; charset="UTF-8"

I was hit this week by opkg giving me a cryptic hint to resolve a problem:

- * Problem 1/2:
 *   - package packagegroup-core-boot-1.0-r17.6.shadow_ghost requires
sysvinit, but none of the providers can be installed
 *
 * Solution 1:
 *   - do not ask to install a package providing packagegroup-core-boot

Digging a bit into how it does things, I saw it's making use of
solver_problem2str(), which in
turn calls solver_findproblemrule(), which is documented as:

 * search for a rule that describes the problem to the
 * user. Actually a pretty hopeless task that may leave the user
 * puzzled. To get all of the needed information use
 * solver_findallproblemrules() instead.

So I ended up patching opkg to call the latter (patch below), yielding the
following output:

- * Problem 1/2:
 *   - package packagegroup-core-boot-1.0-r17.6.shadow_ghost requires
sysvinit, but none of the providers can be installed
 *   - complete list of reasons:
 *     - package sysvinit-2.88dsf-r14.6.aarch64 requires sysvinit-inittab,
but none of the providers can be installed
 *     - package packagegroup-core-boot-1.0-r17.6.shadow_ghost requires
sysvinit, but none of the providers can be installed
 *     - package sysvinit-inittab-2.88dsf-r10.16.shadow_ghost requires
o-usb, but none of the providers can be installed
 *     - conflicting requests
 *     - nothing provides openssl11 >= 1.1.0i needed by
o-usb-0.0.0+git6+2c2d1e6fe3-r1.7.aarch64
 *
 * Solution 1:
 *   - do not ask to install a package providing packagegroup-core-boot

Here I do find the expected information  (openssl11 was a hack I hadded in
sumo, which poluted my first warrior builds, thus polluted my shard-state,
as there were 2 providers of this libssl soversion).  So now I can solve my
problem.

Where do we go from now ?  I'd argue libsolv selects the wrong message, but
its doc does say this API asks for the impossible, so we may not want to
spend time fixing it.
Is it reasonable to include the full list of reasons, maybe flagging those
that solver_findproblemrule() think are the most relevant ?
Or should this be seen as "extended diag" and conditioned by a new opkg
flag, maybe for backward-compatibility of some sort ?
It may make sense to push a function like this to libsolv itself ?


@@ -0,0 +1,38 @@
+Index: opkg-0.4.0/libopkg/solvers/libsolv/opkg_solver_libsolv.c
+===================================================================
+--- opkg-0.4.0.orig/libopkg/solvers/libsolv/opkg_solver_libsolv.c
++++ opkg-0.4.0/libopkg/solvers/libsolv/opkg_solver_libsolv.c
+@@ -795,6 +795,25 @@ static void libsolv_solver_add_job(libso
+     }
+ }
+
++static libsolv_print_all_problem_rules(libsolv_solver_t *libsolv_solver,
Id problem)
++{
++    Queue rules;
++    int i;
++
++    opkg_message(ERROR, "  - complete list of reasons:\n");
++    queue_init(&rules);
++    solver_findallproblemrules(libsolv_solver->solver, problem, &rules);
++    for (i = 0; i < rules.count; i++) {
++        Id type, source, target, dep;
++        Id r = rules.elements[i];
++        type = solver_ruleinfo(libsolv_solver->solver, r, &source,
&target, &dep);
++        opkg_message(ERROR, "    - %s\n",
++                     solver_problemruleinfo2str(libsolv_solver->solver,
++                                                type, source, target,
dep));
++    }
++    queue_free(&rules);
++}
++
+ static int libsolv_solver_solve(libsolv_solver_t *libsolv_solver)
+ {
+     int problem_count = solver_solve(libsolv_solver->solver,
+@@ -810,6 +829,7 @@ static int libsolv_solver_solve(libsolv_
+             opkg_message(ERROR, "Problem %d/%d:\n", problem,
problem_count);
+             opkg_message(ERROR, "  - %s\n",
+                          solver_problem2str(libsolv_solver->solver,
problem));
++            libsolv_print_all_problem_rules(libsolv_solver, problem);
+             opkg_message(ERROR, "\n");
+
+             int solution_count =
solver_solution_count(libsolv_solver->solver,

-- 
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.tech

--00000000000081185e059c8622a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I was hit this week by opkg giving me a cryptic hint =
to resolve a problem:</div><div><br></div><div><div><li class=3D"gmail-li1"=
><div class=3D"gmail-de1">* Problem 1/2:</div></li>
<div class=3D"gmail-de1">=C2=A0* =C2=A0 - package packagegroup-core-boot-1.=
0-r17.6.shadow_ghost requires sysvinit, but none of the providers can be in=
stalled</div>=C2=A0*=20
<div class=3D"gmail-de2">=C2=A0* Solution 1:</div>
=C2=A0* =C2=A0 - do not ask to install a package providing packagegroup-cor=
e-boot</div></div><div><br></div><div>Digging a bit into how it does things=
, I saw it&#39;s making use of solver_problem2str(), which in</div><div>tur=
n calls solver_findproblemrule(), which is documented as:</div><div><br></d=
iv><div>=C2=A0* search for a rule that describes the problem to the<br>=C2=
=A0* user. Actually a pretty hopeless task that may leave the user<br>=C2=
=A0* puzzled. To get all of the needed information use<br>=C2=A0* solver_fi=
ndallproblemrules() instead.</div><div><br></div><div>So I ended up patchin=
g opkg to call the latter (patch below), yielding the following output:</di=
v><div><br></div><div><div><li class=3D"gmail-li1"><div class=3D"gmail-de1"=
>* Problem 1/2:</div></li>
<div class=3D"gmail-de1">=C2=A0* =C2=A0 - package packagegroup-core-boot-1.=
0-r17.6.shadow_ghost requires sysvinit, but none of the providers can be in=
stalled</div>
<div class=3D"gmail-de1">=C2=A0* =C2=A0 - complete list of reasons:</div>
<div class=3D"gmail-de1">=C2=A0* =C2=A0 =C2=A0 - package sysvinit-2.88dsf-r=
14.6.aarch64 requires sysvinit-inittab, but none of the providers can be in=
stalled</div>
<div class=3D"gmail-de2">=C2=A0* =C2=A0 =C2=A0 - package packagegroup-core-=
boot-1.0-r17.6.shadow_ghost requires sysvinit, but none of the providers ca=
n be installed</div>
<div class=3D"gmail-de1">=C2=A0* =C2=A0 =C2=A0 - package sysvinit-inittab-2=
.88dsf-r10.16.shadow_ghost requires o-usb, but none of the providers can be=
 installed</div>
<div class=3D"gmail-de1">=C2=A0* =C2=A0 =C2=A0 - conflicting requests</div>
<div class=3D"gmail-de1">=C2=A0* =C2=A0 =C2=A0 - nothing provides openssl11=
 &gt;=3D 1.1.0i needed by o-usb-0.0.0+git6+2c2d1e6fe3-r1.7.aarch64</div>
<div class=3D"gmail-de1">=C2=A0* </div>
<div class=3D"gmail-de2">=C2=A0* Solution 1:</div>
=C2=A0* =C2=A0 - do not ask to install a package providing packagegroup-cor=
e-boot</div><br></div><div>Here I do find the expected information=C2=A0 (o=
penssl11 was a hack I hadded in sumo, which poluted my first warrior builds=
, thus polluted my shard-state, as there were 2 providers of this libssl so=
version).=C2=A0 So now I can solve my problem.</div><div><br></div><div>Whe=
re do we go from now ?=C2=A0 I&#39;d argue libsolv selects the wrong messag=
e, but its doc does say this API asks for the impossible, so we may not wan=
t to spend time fixing it.</div><div>Is it reasonable to include the full l=
ist of reasons, maybe flagging those that solver_findproblemrule() think ar=
e the most relevant ?<br>Or should this be seen as &quot;extended diag&quot=
; and conditioned by a new opkg flag, maybe for backward-compatibility of s=
ome sort ?</div><div>It may make sense to push a function like this to libs=
olv itself ?<br></div><div><br></div><div><br></div><div>@@ -0,0 +1,38 @@<b=
r>+Index: opkg-0.4.0/libopkg/solvers/libsolv/opkg_solver_libsolv.c<br>+=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>+--- opkg-0.4.0.orig/li=
bopkg/solvers/libsolv/opkg_solver_libsolv.c<br>++++ opkg-0.4.0/libopkg/solv=
ers/libsolv/opkg_solver_libsolv.c<br>+@@ -795,6 +795,25 @@ static void libs=
olv_solver_add_job(libso<br>+ =C2=A0 =C2=A0 }<br>+ }<br>+ <br>++static libs=
olv_print_all_problem_rules(libsolv_solver_t *libsolv_solver, Id problem)<b=
r>++{<br>++ =C2=A0 =C2=A0Queue rules;<br>++ =C2=A0 =C2=A0int i;<br>++<br>++=
 =C2=A0 =C2=A0opkg_message(ERROR, &quot; =C2=A0- complete list of reasons:\=
n&quot;);<br>++ =C2=A0 =C2=A0queue_init(&amp;rules);<br>++ =C2=A0 =C2=A0sol=
ver_findallproblemrules(libsolv_solver-&gt;solver, problem, &amp;rules);<br=
>++ =C2=A0 =C2=A0for (i =3D 0; i &lt; rules.count; i++) {<br>++ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Id type, source, target, dep;<br>++ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Id r =3D rules.elements[i];<br>++ =C2=A0 =C2=A0 =C2=A0 =C2=A0type =3D=
 solver_ruleinfo(libsolv_solver-&gt;solver, r, &amp;source, &amp;target, &a=
mp;dep);<br>++ =C2=A0 =C2=A0 =C2=A0 =C2=A0opkg_message(ERROR, &quot; =C2=A0=
 =C2=A0- %s\n&quot;,<br>++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 solver_problemruleinfo2str(libsolv_solver-&gt;solver,=
<br>++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0type, source, target, dep));<br>++ =C2=A0 =C2=A0=
}<br>++ =C2=A0 =C2=A0queue_free(&amp;rules);<br>++}<br>++<br>+ static int l=
ibsolv_solver_solve(libsolv_solver_t *libsolv_solver)<br>+ {<br>+ =C2=A0 =
=C2=A0 int problem_count =3D solver_solve(libsolv_solver-&gt;solver,<br>+@@=
 -810,6 +829,7 @@ static int libsolv_solver_solve(libsolv_<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opkg_message(ERROR, &quot;Problem %d/%d:\n&=
quot;, problem, problem_count);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 opkg_message(ERROR, &quot; =C2=A0- %s\n&quot;,<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0so=
lver_problem2str(libsolv_solver-&gt;solver, problem));<br>++ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0libsolv_print_all_problem_rules(libsolv_solver, =
problem);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opkg_message(ERROR=
, &quot;\n&quot;);<br>+ <br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int=
 solution_count =3D solver_solution_count(libsolv_solver-&gt;solver,</div><=
div><br></div><div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-s=
martmail=3D"gmail_signature">Yann Dirson &lt;<a href=3D"mailto:yann@blade-g=
roup.com" target=3D"_blank">yann@blade-group.com</a>&gt;<br>Blade / Shadow =
-- <a href=3D"http://shadow.tech" target=3D"_blank">http://shadow.tech</a><=
br><br></div></div></div>

--00000000000081185e059c8622a2--
