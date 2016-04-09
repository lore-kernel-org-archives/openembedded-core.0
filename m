Return-Path: <kad@kad.name>
Received: from mail-ig0-f196.google.com (mail-ig0-f196.google.com
	[209.85.213.196])
	by mail.openembedded.org (Postfix) with ESMTP id A7CC47713C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Apr 2016 10:36:17 +0000 (UTC)
Received: by mail-ig0-f196.google.com with SMTP id kb1so5385978igb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Apr 2016 03:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kad-name.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=d88v0sUEg6IK2fI1ZTAl2DFuFW0tbNxt0AKC0U+T//E=;
	b=S7wMjGQnZQmJtpxJBum3qQNpMVq703hDRPozup8tRvDHOO1wuIWoypIgHOcGHAqHnY
	jZcyrhEmKlEtb6lfv41fQl8HBhTMYTrsPKEbCxRKOoIfR+AJ+DlPLIvry0K5QrXFOjSc
	AC7lAq37VDhF7dSGOLNR6tN7gCTxaxjZsZm7XJb0CIEWnNU5VJO3PJ3UWN4gKxLyN9Ar
	MefVZYqIHAXd1PoGx3Pw0bml12U+gtgdgBRdn+VmIu0aZnrz0YjgOAHmX9SEJCKGuGgJ
	ABvTj19Fh3kSw9/7lXbGu+sdSUYC/dbnYpiTRP/MMtx2B+l6HgxyPDms572KcmacSlVv
	QInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=d88v0sUEg6IK2fI1ZTAl2DFuFW0tbNxt0AKC0U+T//E=;
	b=VsQa9uLkjEdbIo7xUinQ9mNwVDdiNZW/i5ErKQSFlEMPPVAgdwHCM24NiiUMlkHS8Q
	0qCFl/KI35vbnQoUSqn1vWi6EEk9PAekYRBvvd5SC7oT8WKisbvTDflgGc5Yf4wSsFY8
	0nAqrTIGuqOPkVLWIzWRn5TN3+HkP/gQtgNPWuzrtsobsnjZ8xzCv50b1zdPtxqROXp/
	WH46eirxratp3MyB17o29jSOMbHpM6jxYNKpiVTl+BY7qkbGvJ+R6td4gowqEYTXfLWW
	8b+1Q3wx/sb/SbwtQtZu41vocbnfMz6CI0DM7DSoZ3hTXm2sVXdiXirLhQJCGsObhxoz
	nfyw==
X-Gm-Message-State: AD7BkJIGIVXAG0dAtHn9Za1Gt3VEOeb70i1NhUmnjBLMBM526QJ8ose8kWl89XmpjQnVXemIQ5BPeWMeKvAIWA==
MIME-Version: 1.0
X-Received: by 10.50.112.42 with SMTP id in10mr8068718igb.1.1460198177832;
	Sat, 09 Apr 2016 03:36:17 -0700 (PDT)
Received: by 10.107.35.137 with HTTP; Sat, 9 Apr 2016 03:36:17 -0700 (PDT)
In-Reply-To: <1460106859-14007-1-git-send-email-joshua.g.lock@intel.com>
References: <1460106859-14007-1-git-send-email-joshua.g.lock@intel.com>
Date: Sat, 9 Apr 2016 13:36:17 +0300
Message-ID: <CANFkWp=ynO2J38+k=mBH6Y3GFOb2kZhbM9zea2T09EL2BDZHxA@mail.gmail.com>
From: Alexander Kanevskiy <kad@kad.name>
To: Joshua Lock <joshua.g.lock@intel.com>
Cc: Joshua Lock <joshua.lock@collabora.co.uk>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] wic/utils/partitionedfs.py: assemble .wic images as sparse files
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
X-List-Received-Date: Sat, 09 Apr 2016 10:36:17 -0000
Content-Type: multipart/alternative; boundary=047d7b4140f2b1333f05300ae1fb

--047d7b4140f2b1333f05300ae1fb
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 8, 2016 at 12:14 PM, Joshua Lock <joshua.g.lock@intel.com>
wrote:

> From: Joshua Lock <joshua.lock@collabora.co.uk>
>
> The individual partitions created by wic are sparse but without
> this change the assembled image is written as one (potentially
> very) large file.
>
> Preserve sparseness in the assembled image by passing the sparse
> conversion symbol.
>
> [YOCTO #9099]
>
> Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
> ---
>  scripts/lib/wic/utils/partitionedfs.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/lib/wic/utils/partitionedfs.py
> b/scripts/lib/wic/utils/partitionedfs.py
> index 5a103bb..3e2b420 100644
> --- a/scripts/lib/wic/utils/partitionedfs.py
> +++ b/scripts/lib/wic/utils/partitionedfs.py
> @@ -340,7 +340,7 @@ class Image(object):
>              source = part['source_file']
>              if source:
>                  # install source_file contents into a partition
> -                cmd = "dd if=%s of=%s bs=%d seek=%d count=%d
> conv=notrunc" % \
> +                cmd = "dd if=%s of=%s bs=%d seek=%d count=%d
> conv=notrunc,sparse" % \
>                        (source, image_file, self.sector_size,
>                         part['start'], part['size'])
>                  exec_cmd(cmd)
>



This might be dangerous. Even in recent version of DD (coreutils 8.25), it
might not detect in source file mapped/unmapped blocks properly,
(just use is_nul() function to check if block contains only zeros, instead
of e.g. fiemap).
Result might be so, that in output file block which must be zeros is
actually become unmapped. And as consequence, if it might not be written to
destination drive.

Let me show example based on Ostro Project sparse images:

kad@orava:/tmp> ls -ls 2222
308416 -rw-r--r-- 1 kad users 5280628736 Apr  6 00:53 2222
kad@orava:/tmp> grep /MappedBlocksCount 2222.bmap
    <MappedBlocksCount> 77104   </MappedBlocksCount>

Now, let's copy it with dd:
kad@orava:/tmp> ~/cu/coreutils-8.25/src/dd if=2222 of=4444
conv=notrunc,sparse bs=4096
1289216+0 records in
1289216+0 records out
5280628736 bytes (5.3 GB, 4.9 GiB) copied, 1.31239 s, 4.0 GB/s
kad@orava:/tmp> bmaptool create 4444 -o 4444.bmap
kad@orava:/tmp> ls -ls 4444
308348 -rw-r--r-- 1 kad users 5280628736 Apr  9 13:22 4444
kad@orava:/tmp> grep /MappedBlocksCount 4444.bmap
    <MappedBlocksCount> 77087   </MappedBlocksCount>
kad@orava:/tmp>

As you can see, in result of dd copied file we have less blocks mapped than
in original.

Diffing block ranges:  (- original file, + dd copied)
     <BlockMap>
-        <Range> 0-4 </Range>
-        <Range> 768-3321 </Range>
-        <Range> 4608-7161 </Range>
+        <Range> 0 </Range>
+        <Range> 768-770 </Range>
+        <Range> 772-774 </Range>
+        <Range> 776 </Range>
+        <Range> 780-3321 </Range>
+        <Range> 4608-4610 </Range>
+        <Range> 4612-4614 </Range>
+        <Range> 4616 </Range>
+        <Range> 4620-7161 </Range>
-        <Range> 1289211-1289215 </Range>
+        <Range> 1289211 </Range>
+        <Range> 1289215 </Range>
     </BlockMap>

As you can see, some blocks that must be cleaned (e.g. 1-3 around MBR or in
the end, 1289211-1289215 where GPT bits located) are not marked as mapped,
thus in case of sparse aware writing tool used to write to destination
drive it might result as unwritten zero blocks, thus some old data would
left on device.

I would suggest not to accept this patch right now, and do copy function
that would be aware about real mapped/unmapped blocks.
Something similar that I've did for Ostro Project here:
https://github.com/ostroproject/meta-ostro/commit/d883169c3266c3c44f22db5f75ae94c4cf0f2924

but adopted to be generic for use inside wic.


-- 
br, Alexander Kanevskiy

--047d7b4140f2b1333f05300ae1fb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Apr 8, 2016 at 12:14 PM, Joshua Lock <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:joshua.g.lock@intel.com" target=3D"_blank">joshua.g.lock@inte=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204=
,204);border-left-style:solid;padding-left:1ex">From: Joshua Lock &lt;<a hr=
ef=3D"mailto:joshua.lock@collabora.co.uk">joshua.lock@collabora.co.uk</a>&g=
t;<br>
<br>
The individual partitions created by wic are sparse but without<br>
this change the assembled image is written as one (potentially<br>
very) large file.<br>
<br>
Preserve sparseness in the assembled image by passing the sparse<br>
conversion symbol.<br>
<br>
[YOCTO #9099]<br>
<br>
Signed-off-by: Joshua Lock &lt;<a href=3D"mailto:joshua.lock@collabora.co.u=
k">joshua.lock@collabora.co.uk</a>&gt;<br>
---<br>
=C2=A0scripts/lib/wic/utils/partitionedfs.py | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils=
/partitionedfs.py<br>
index 5a103bb..3e2b420 100644<br>
--- a/scripts/lib/wic/utils/partitionedfs.py<br>
+++ b/scripts/lib/wic/utils/partitionedfs.py<br>
@@ -340,7 +340,7 @@ class Image(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source =3D part[&#39;source=
_file&#39;]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if source:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# install sou=
rce_file contents into a partition<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;dd i=
f=3D%s of=3D%s bs=3D%d seek=3D%d count=3D%d conv=3Dnotrunc&quot; % \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;dd i=
f=3D%s of=3D%s bs=3D%d seek=3D%d count=3D%d conv=3Dnotrunc,sparse&quot; % \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(source, image_file, self.sector_size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 part[&#39;start&#39;], part[&#39;size&#39;])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec_cmd(cmd)=
<br></blockquote><div><br></div><div><br></div><div><br></div><div>This mig=
ht be dangerous. Even in recent version of DD (coreutils 8.25), it might no=
t detect in source file mapped/unmapped blocks properly,=C2=A0</div><div>(j=
ust use is_nul() function to check if block contains only zeros, instead of=
 e.g. fiemap).=C2=A0</div><div>Result might be so, that in output file bloc=
k which must be zeros is actually become unmapped. And as consequence, if i=
t might not be written to destination drive.</div><div><br></div><div>Let m=
e show example based on Ostro Project sparse images:</div><div><br></div><d=
iv><div>kad@orava:/tmp&gt; ls -ls 2222</div><div>308416 -rw-r--r-- 1 kad us=
ers 5280628736 Apr =C2=A06 00:53 2222</div></div><div><div>kad@orava:/tmp&g=
t; grep /MappedBlocksCount 2222.bmap<br></div><div>=C2=A0 =C2=A0 &lt;Mapped=
BlocksCount&gt; 77104 =C2=A0 &lt;/MappedBlocksCount&gt;</div></div><div><br=
></div><div>Now, let&#39;s copy it with dd:</div><div>kad@orava:/tmp&gt; ~/=
cu/coreutils-8.25/src/dd if=3D2222 of=3D4444 conv=3Dnotrunc,sparse bs=3D409=
6</div><div>1289216+0 records in</div><div>1289216+0 records out</div><div>=
5280628736 bytes (5.3 GB, 4.9 GiB) copied, 1.31239 s, 4.0 GB/s</div><div>ka=
d@orava:/tmp&gt; bmaptool create 4444 -o 4444.bmap<br></div><div><div>kad@o=
rava:/tmp&gt; ls -ls 4444</div></div><div>308348 -rw-r--r-- 1 kad users 528=
0628736 Apr =C2=A09 13:22 4444<br></div><div><div>kad@orava:/tmp&gt; grep /=
MappedBlocksCount 4444.bmap</div><div>=C2=A0 =C2=A0 &lt;MappedBlocksCount&g=
t; 77087 =C2=A0 &lt;/MappedBlocksCount&gt;</div><div>kad@orava:/tmp&gt;</di=
v></div><div><br></div><div>As you can see, in result of dd copied file we =
have less blocks mapped than in original.</div><div><br></div><div>Diffing =
block ranges: =C2=A0(- original file, + dd copied)</div><div><div>=C2=A0 =
=C2=A0 =C2=A0&lt;BlockMap&gt;</div><div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Ra=
nge&gt; 0-4 &lt;/Range&gt;</div><div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Range=
&gt; 768-3321 &lt;/Range&gt;</div><div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Ran=
ge&gt; 4608-7161 &lt;/Range&gt;</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;=
Range&gt; 0 &lt;/Range&gt;</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Range=
&gt; 768-770 &lt;/Range&gt;</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Rang=
e&gt; 772-774 &lt;/Range&gt;</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Ran=
ge&gt; 776 &lt;/Range&gt;</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Range&=
gt; 780-3321 &lt;/Range&gt;</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Rang=
e&gt; 4608-4610 &lt;/Range&gt;</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;R=
ange&gt; 4612-4614 &lt;/Range&gt;</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0&l=
t;Range&gt; 4616 &lt;/Range&gt;</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;=
Range&gt; 4620-7161 &lt;/Range&gt;</div><div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0&=
lt;Range&gt; 1289211-1289215 &lt;/Range&gt;<br></div><div>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&lt;Range&gt; 1289211 &lt;/Range&gt;</div><div>+ =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&lt;Range&gt; 1289215 &lt;/Range&gt;</div><div>=C2=A0 =C2=A0 =
=C2=A0&lt;/BlockMap&gt;</div></div><div><br></div><div>As you can see, some=
 blocks that must be cleaned (e.g. 1-3 around MBR or in the end, 1289211-12=
89215 where GPT bits located) are not marked as mapped,</div><div>thus in c=
ase of sparse aware writing tool used to write to destination drive it migh=
t result as unwritten zero blocks, thus some old data would left on device.=
</div><div><br></div><div>I would suggest not to accept this patch right no=
w, and do copy function that would be aware about real mapped/unmapped bloc=
ks.</div><div>Something similar that I&#39;ve did for Ostro Project here:=
=C2=A0<a href=3D"https://github.com/ostroproject/meta-ostro/commit/d883169c=
3266c3c44f22db5f75ae94c4cf0f2924">https://github.com/ostroproject/meta-ostr=
o/commit/d883169c3266c3c44f22db5f75ae94c4cf0f2924</a>=C2=A0</div><div>but a=
dopted to be generic for use inside wic.</div><div><br></div></div><div><br=
></div>-- <br><div class=3D"gmail_signature">br, Alexander Kanevskiy</div>
</div></div>

--047d7b4140f2b1333f05300ae1fb--
