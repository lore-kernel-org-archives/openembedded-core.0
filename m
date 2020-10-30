Subject: openssl: Proposal to stop creating /etc/ssl/certs
To: openembedded-core@lists.openembedded.org
From: nate.karstens@garmin.com
X-Originating-Location: Olathe, Kansas, US (204.77.163.55)
X-Originating-Platform: Windows Firefox 81
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 30 Oct 2020 10:25:31 -0700
Message-ID: <xP9d.1604078731359224154.jFZQ@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Ep8ollUA0F1TV1AmRmGc"

--Ep8ollUA0F1TV1AmRmGc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Greetings,

The openssl recipe installs an empty folder /etc/ssl/certs. This is eventu=
ally where other recipes like ca-certificates can copy CA certificates for =
the system. We are working on a tool that can hot-swap those certificates a=
t runtime. The only way to have this transition be seamless and atomic is t=
o make /etc/ssl/certs a symlink to another folder that contains the actual =
certificates; to update the certificates we just replace the symlink.

Our recipe for this tool conflicts with the empty folder in the openssl pa=
ckage. We were wondering if it made sense to change the openssl recipe to n=
o longer create this folder, the idea being that recipes that populate the =
folder (like ca-certificates) would be responsible for creating it.

Here is a link to the recipe:

https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-connecti=
vity/openssl/openssl_1.1.1g.bb ( https://urldefense.com/v3/__https:/git.yoc=
toproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-connectivity/openssl/ope=
nssl_1.1.1g.bb__;!!EJc4YC3iFmQ!CgiLpD5LsQ6adCzphoFeUHIvQm-M8g2nkDA4_4gtF71e=
Hm20Q0lGSwMahtdHA3ybWA$ )

Line 135 does contain a note that Debian sets up the SSL structure. Creati=
ng a placeholder for where CA certificates would eventually go makes sense =
with certain systems. There could be desktop distros that rely on the user =
to manually install the certs they need for their organization and providin=
g a location for this would be helpful. I don=E2=80=99t think this makes se=
nse for the typical embedded system where this folder is on a read-only fil=
esystem.

I've just been testing locally with a bbappend that uses rmdir to remove t=
he folder, but unless there are objections I will submit a patch that remov=
es lines 137 (moving the 'mv' to the next line) and 144. I think line 152 c=
an remain in case the variable is useful to anyone.

Thanks,

Nate Karstens
Marine Software Engineering
Garmin International, Inc.

--Ep8ollUA0F1TV1AmRmGc
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-margi=
n-bottom-alt: auto;" style=3D"margin:0px;">Greetings,<br/><br/>The openssl =
recipe installs an empty folder /etc/ssl/certs. This is eventually where ot=
her recipes like ca-certificates can copy CA certificates for the system. W=
e are working on a tool that can hot-swap those certificates at runtime. Th=
e only way to have this transition be seamless and atomic is to make /etc/s=
sl/certs a symlink to another folder that contains the actual certificates;=
 to update the certificates we just replace the symlink.</p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;">=C2=A0</p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;">Our recipe for this tool confli=
cts with the empty folder in the openssl package. We were wondering if it m=
ade sense to change the openssl recipe to no longer create this folder, the=
 idea being that recipes that populate the folder (like ca-certificates) wo=
uld be responsible for creating it.</p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;">=C2=A0</p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;">Here is a link to the recipe:</=
p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;">=C2=A0</p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;"><a href=3D"https://urldefense.c=
om/v3/__https:/git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-co=
nnectivity/openssl/openssl_1.1.1g.bb__;!!EJc4YC3iFmQ!CgiLpD5LsQ6adCzphoFeUH=
IvQm-M8g2nkDA4_4gtF71eHm20Q0lGSwMahtdHA3ybWA$" target=3D"_blank" rel=3D"noo=
pener">https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-co=
nnectivity/openssl/openssl_1.1.1g.bb</a></p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;">=C2=A0</p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;">Line 135 does contain a note th=
at Debian sets up the SSL structure. Creating a placeholder for where CA ce=
rtificates would eventually go makes sense with certain systems. There coul=
d be desktop distros that rely on the user to manually install the certs th=
ey need for their organization and providing a location for this would be h=
elpful. I don=E2=80=99t think this makes sense for the typical embedded sys=
tem where this folder is on a read-only filesystem.</p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;">=C2=A0</p>
<p class=3D"DefangedMsoNormal" style=3D"mso-margin-top-alt: auto; mso-marg=
in-bottom-alt: auto;" style=3D"margin:0px;">I&#39;ve just been testing loca=
lly with a bbappend that uses rmdir to remove the folder, but unless there =
are objections I will submit a patch that removes lines 137 (moving the &#3=
9;mv&#39; to the next line) and 144. I think line 152 can remain in case th=
e variable is useful to anyone.<br/><br/>Thanks,<br/><br/>Nate Karstens<br/=
>Marine Software Engineering<br/>Garmin International, Inc.</p>
<!-- [if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-US</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
  <m:mathPr>
   <m:mathFont m:val=3D"Cambria Math"/>
   <m:brkBin m:val=3D"before"/>
   <m:brkBinSub m:val=3D"--"/>
   <m:smallFrac m:val=3D"off"/>
   <m:dispDef/>
   <m:lMargin m:val=3D"0"/>
   <m:rMargin m:val=3D"0"/>
   <m:defJc m:val=3D"centerGroup"/>
   <m:wrapIndent m:val=3D"1440"/>
   <m:intLim m:val=3D"subSup"/>
   <m:naryLim m:val=3D"undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!-- [if gte mso 9]><xml>
 <w:LatentStyles DefLockedState=3D"false" DefUnhideWhenUsed=3D"false"
  DefSemiHidden=3D"false" DefQFormat=3D"false" DefPriority=3D"99"
  LatentStyleCount=3D"377">
  <w:LsdException Locked=3D"false" Priority=3D"0" QFormat=3D"true" Name=3D=
"Normal"/>
  <w:LsdException Locked=3D"false" Priority=3D"9" QFormat=3D"true" Name=3D=
"heading 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 7"/>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 8"/>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 9"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"index 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"index 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"index 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"index 4"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"index 5"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"index 6"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"index 7"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"index 8"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"index 9"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 7"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 8"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 9"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Normal Indent"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"footnote text"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"annotation text"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"header"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"footer"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"index heading"/>
  <w:LsdException Locked=3D"false" Priority=3D"35" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"caption"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"table of figures"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"envelope address"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"envelope return"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"footnote reference"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"annotation reference"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"line number"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"page number"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"endnote reference"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"endnote text"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"table of authorities"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"macro"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"toa heading"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"List"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"List Bullet"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"List Number"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"List 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"List 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"List 4"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"List 5"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"List Bullet 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"List Bullet 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"List Bullet 4"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"List Bullet 5"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"List Number 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"List Number 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"List Number 4"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"List Number 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"10" QFormat=3D"true" Name=
=3D"Title"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Closing"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Signature"/>
  <w:LsdException Locked=3D"false" Priority=3D"1" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"Default Paragraph Font"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Body Text"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Body Text Indent"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"List Continue"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"List Continue 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"List Continue 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"List Continue 4"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"List Continue 5"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Message Header"/>
  <w:LsdException Locked=3D"false" Priority=3D"11" QFormat=3D"true" Name=
=3D"Subtitle"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Salutation"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Date"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Body Text First Indent"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Body Text First Indent 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Note Heading"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Body Text 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Body Text 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Body Text Indent 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Body Text Indent 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Block Text"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Hyperlink"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"FollowedHyperlink"/>
  <w:LsdException Locked=3D"false" Priority=3D"22" QFormat=3D"true" Name=
=3D"Strong"/>
  <w:LsdException Locked=3D"false" Priority=3D"20" QFormat=3D"true" Name=
=3D"Emphasis"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Document Map"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Plain Text"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"E-mail Signature"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"HTML Top of Form"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"HTML Bottom of Form"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Normal (Web)"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"HTML Acronym"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"HTML Address"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"HTML Cite"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"HTML Code"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"HTML Definition"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"HTML Keyboard"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"HTML Preformatted"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"HTML Sample"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"HTML Typewriter"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"HTML Variable"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Normal Table"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"annotation subject"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"No List"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Outline List 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Outline List 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Outline List 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Simple 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Simple 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Simple 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Classic 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Classic 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Classic 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Classic 4"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Colorful 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Colorful 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Colorful 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Columns 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Columns 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Columns 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Columns 4"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Columns 5"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Grid 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Grid 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Grid 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Grid 4"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Grid 5"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Grid 6"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Grid 7"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Grid 8"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table List 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table List 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table List 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table List 4"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table List 5"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table List 6"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table List 7"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table List 8"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table 3D effects 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table 3D effects 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table 3D effects 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Contemporary"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Elegant"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Professional"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Subtle 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Subtle 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Web 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Web 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Web 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Balloon Text"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" Name=3D"Table Grid"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Table Theme"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Name=3D"Placeholder=
 Text"/>
  <w:LsdException Locked=3D"false" Priority=3D"1" QFormat=3D"true" Name=3D=
"No Spacing"/>
  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading"/=
>
  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List"/>
  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid"/>
  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading =
1"/>
  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading =
2"/>
  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1"/=
>
  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2"/=
>
  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1"/=
>
  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2"/=
>
  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3"/=
>
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List"/>
  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shadin=
g"/>
  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List"/=
>
  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid"/=
>
  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading A=
ccent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List Acce=
nt 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Acce=
nt 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading =
1 Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading =
2 Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 A=
ccent 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Name=3D"Revision"/>
  <w:LsdException Locked=3D"false" Priority=3D"34" QFormat=3D"true"
   Name=3D"List Paragraph"/>
  <w:LsdException Locked=3D"false" Priority=3D"29" QFormat=3D"true" Name=
=3D"Quote"/>
  <w:LsdException Locked=3D"false" Priority=3D"30" QFormat=3D"true"
   Name=3D"Intense Quote"/>
  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 A=
ccent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 A=
ccent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 A=
ccent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 A=
ccent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Accen=
t 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shadin=
g Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List A=
ccent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid A=
ccent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading A=
ccent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List Acce=
nt 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Acce=
nt 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading =
1 Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading =
2 Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 A=
ccent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 A=
ccent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 A=
ccent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 A=
ccent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 A=
ccent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Accen=
t 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shadin=
g Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List A=
ccent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid A=
ccent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading A=
ccent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List Acce=
nt 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Acce=
nt 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading =
1 Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading =
2 Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 A=
ccent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 A=
ccent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 A=
ccent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 A=
ccent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 A=
ccent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Accen=
t 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shadin=
g Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List A=
ccent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid A=
ccent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading A=
ccent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List Acce=
nt 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Acce=
nt 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading =
1 Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading =
2 Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 A=
ccent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 A=
ccent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 A=
ccent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 A=
ccent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 A=
ccent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Accen=
t 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shadin=
g Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List A=
ccent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid A=
ccent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading A=
ccent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List Acce=
nt 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Acce=
nt 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading =
1 Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading =
2 Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 A=
ccent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 A=
ccent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 A=
ccent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 A=
ccent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 A=
ccent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Accen=
t 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shadin=
g Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List A=
ccent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid A=
ccent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading A=
ccent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List Acce=
nt 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Acce=
nt 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading =
1 Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading =
2 Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 A=
ccent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 A=
ccent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 A=
ccent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 A=
ccent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 A=
ccent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Accen=
t 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shadin=
g Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List A=
ccent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid A=
ccent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"19" QFormat=3D"true"
   Name=3D"Subtle Emphasis"/>
  <w:LsdException Locked=3D"false" Priority=3D"21" QFormat=3D"true"
   Name=3D"Intense Emphasis"/>
  <w:LsdException Locked=3D"false" Priority=3D"31" QFormat=3D"true"
   Name=3D"Subtle Reference"/>
  <w:LsdException Locked=3D"false" Priority=3D"32" QFormat=3D"true"
   Name=3D"Intense Reference"/>
  <w:LsdException Locked=3D"false" Priority=3D"33" QFormat=3D"true" Name=
=3D"Book Title"/>
  <w:LsdException Locked=3D"false" Priority=3D"37" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"Bibliography"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"TOC Heading"/>
  <w:LsdException Locked=3D"false" Priority=3D"41" Name=3D"Plain Table 1"/=
>
  <w:LsdException Locked=3D"false" Priority=3D"42" Name=3D"Plain Table 2"/=
>
  <w:LsdException Locked=3D"false" Priority=3D"43" Name=3D"Plain Table 3"/=
>
  <w:LsdException Locked=3D"false" Priority=3D"44" Name=3D"Plain Table 4"/=
>
  <w:LsdException Locked=3D"false" Priority=3D"45" Name=3D"Plain Table 5"/=
>
  <w:LsdException Locked=3D"false" Priority=3D"40" Name=3D"Grid Table Ligh=
t"/>
  <w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 Li=
ght"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Da=
rk"/>
  <w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 Co=
lorful"/>
  <w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 Co=
lorful"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 Ac=
cent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Ac=
cent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Ac=
cent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Da=
rk Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 Ac=
cent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Ac=
cent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Ac=
cent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Da=
rk Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 Ac=
cent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Ac=
cent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Ac=
cent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Da=
rk Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 Ac=
cent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Ac=
cent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Ac=
cent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Da=
rk Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 Ac=
cent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Ac=
cent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Ac=
cent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Da=
rk Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 Ac=
cent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Ac=
cent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Ac=
cent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Da=
rk Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 Li=
ght"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Da=
rk"/>
  <w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 Co=
lorful"/>
  <w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 Co=
lorful"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"List Table 1 Light Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 Ac=
cent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 Ac=
cent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 Ac=
cent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Da=
rk Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"List Table 1 Light Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 Ac=
cent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 Ac=
cent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 Ac=
cent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Da=
rk Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"List Table 1 Light Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 Ac=
cent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 Ac=
cent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 Ac=
cent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Da=
rk Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"List Table 1 Light Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 Ac=
cent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 Ac=
cent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 Ac=
cent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Da=
rk Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"List Table 1 Light Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 Ac=
cent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 Ac=
cent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 Ac=
cent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Da=
rk Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"List Table 1 Light Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 Ac=
cent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 Ac=
cent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 Ac=
cent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Da=
rk Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"List Table 7 Colorful Accent 6"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Mention"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Smart Hyperlink"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Hashtag"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Unresolved Mention"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Smart Link"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"
   Name=3D"Smart Link Error"/>
 </w:LatentStyles>
</xml><![endif]--><!-- [if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin:0in;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman",serif;}
</style>
<![endif]-->

--Ep8ollUA0F1TV1AmRmGc--
